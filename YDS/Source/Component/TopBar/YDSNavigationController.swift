//
//  YDSNavigationController.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/08/09.
//

import UIKit

/**
 YDS 스타일의 NavigationController입니다.
 RootViewController는 굵은 Title이 표시됩니다.
 기본 NavigationController에서 배경색, 투명도, 글씨 폰트, 컬러, 버튼 간격 등이 커스텀 되었습니다.
 */
public class YDSNavigationController: UINavigationController {
    
    //  MARK: - 외부에서 지정할 수 있는 속성
    
    /**
     RootViewController의 NavigationBar 상단에 들어가는
     굵은 Title의 String입니다.
     */
    public override var title: String? {
        didSet { self.titleLabel.text = title }
    }
        
    private let titleLabel: YDSLabel = {
        let label = YDSLabel(style: .title2)
        label.textColor = YDSColor.textPrimary
        return label
    }()
    
    /**
     YDS 스타일을 적용한 NavigationController를 생성합니다.
     
     - Parameters:
        - title: RootViewController의 NavigationBar 상단에 들어가는 굵은 title의 String 값입니다.
        - rootViewController: NavigationController의 rootViewController입니다.
     */
    public init(title: String?, rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        self.title = title
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupFullWidthBackGesture()
    }
    
    /**
     뷰를 세팅합니다.
     */
    private func setupView() {
        setProperties()
    }
    
    /**
     각종 프로퍼티를 세팅합니다.
     */
    private func setProperties() {
        setNavigationBarAppearance()
    }
    
    /**
     NavigationBar의 외관을 설정합니다.
     */
    private func setNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = YDSColor.bgElevated
        appearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: YDSColor.textPrimary,
            NSAttributedString.Key.font: YDSFont.subtitle2,
        ]
        appearance.setBackIndicatorImage(YDSIcon.arrowLeftLine,
                                         transitionMaskImage: YDSIcon.arrowLeftLine)
        appearance.shadowColor = nil
        
        navigationBar.tintColor = YDSColor.buttonNormal
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.compactAppearance = appearance
    }
    
    /**
     화면 중 어디를 스와이프해도 ViewController를 Pop 하기 위해
     UIPanGestureRecognizer를 생성합니다.
     */
    private lazy var fullWidthBackGestureRecognizer = UIPanGestureRecognizer()
}


extension YDSNavigationController {
    
    /**
     ViewController가 Push될 때
     count가 1이라면(=root밖에 없다면) 굵은 titleLabel을 세팅합니다.
     count가 1이 아니라면(=root 이외에 다른게 있다면) backBarButtonItem을 초기화하여
     backButton 옆에 상위 viewController의 title이 나타나지 않도록 합니다.
     */
    public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        if viewControllers.count == 1 {
            titleLabel.text = title
            navigationBar.topItem?.setLeftBarButton(UIBarButtonItem(customView: titleLabel),
                                                    animated: true)
        } else {
            navigationBar.topItem?.backBarButtonItem = UIBarButtonItem()
        }
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        navigationBar.removeButtonBarSpacing()
        navigationBar.setButtonBarProperties()
    }
}


extension YDSNavigationController: UIGestureRecognizerDelegate {
    
    /**
     화면 중 어디를 스와이프해도 ViewController를 Pop 하기 위해
     UIPanGestureRecognizer를 설정합니다.
     */
    private func setupFullWidthBackGesture() {
        guard
            let interactivePopGestureRecognizer = interactivePopGestureRecognizer,
            let targets = interactivePopGestureRecognizer.value(forKey: "targets")
        else {
            return
        }

        fullWidthBackGestureRecognizer.setValue(targets, forKey: "targets")
        fullWidthBackGestureRecognizer.delegate = self
        view.addGestureRecognizer(fullWidthBackGestureRecognizer)
    }
    
    /**
     UINavigationController의
     기본 SwipeBack 옵션이 True 이면서
     Stack에 ViewController가 1개 이상일 때(=root 이외에 다른 ViewController가 있을 때)
     PanGestureRecognizer에 의해 SwipeBack 액션을 실행합니다.
     */
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let isSystemSwipeToBackEnabled = interactivePopGestureRecognizer?.isEnabled == true
        let isThereStackedViewControllers = viewControllers.count > 1
        return isSystemSwipeToBackEnabled && isThereStackedViewControllers
    }
    
}

