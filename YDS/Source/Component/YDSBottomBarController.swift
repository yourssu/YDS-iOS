//
//  YDSBottomBarController.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/08/07.
//

import UIKit
import YDS_Essential

/**
 YDSBottomBar를 포함하는 Controller입니다.
 
 # 특징
 각 Item 터치 시 햅틱 반응과 함께 스프링 애니메이션이 재생됩니다.
 
 # 주의
 TabBarItem에 title이 nil이면 이미지를 자동으로 중앙 정렬 해줍니다.
 imageInsets를 설정하지 마세요.
 
 # 상속
 UITabBarController를 상속받았습니다.
 */
open class YDSBottomBarController: UITabBarController {

    // MARK: - 내부에서 사용되는 상수

    /**
     내부에서 사용되는 각종 레이아웃 관련 수치입니다.
     */
    private enum Dimension {
        static let itemImageVerticalInset: CGFloat = 6
    }

    //  MARK - 뷰

    /**
     탭바 상단에 삽입되는 디바이더입니다.
     */
    private let divider = YDSDivider(.horizontal)

    // MARK: - 진동 관련 인스턴스

    /**
     TabBarItem이 터치됐을 때
     진동 피드백을 전달할지 결정하는 변수입니다.
     */
    public var isImpactFeedbackEnabled: Bool = true

    /**
     각 Item을 Touch 했을 때 진동이 울리도록 만들어주는 feedbackGenerator입니다.
     */
    private let feedbackGenerator = UIImpactFeedbackGenerator(style: .light)

    // MARK: - 메소드

    open override func viewDidLoad() {
        super.viewDidLoad()
        feedbackGenerator.prepare()

        setupView()
    }

    /**
     뷰를 세팅합니다.
     */
    private func setupView() {
        setProperties()
        setLayouts()
    }

    /**
     각종 프로퍼티를 세팅합니다.
     */
    private func setProperties() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = YDSColor.bgElevated
        appearance.shadowColor = .clear

        let tabBarItemAppearance = UITabBarItemAppearance(style: .stacked)
        tabBarItemAppearance.normal.iconColor = YDSColor.bottomBarNormal
        tabBarItemAppearance.normal.titleTextAttributes = [.foregroundColor: YDSColor.bottomBarNormal]
        tabBarItemAppearance.selected.iconColor = YDSColor.bottomBarSelected
        tabBarItemAppearance.selected.titleTextAttributes = [.foregroundColor: YDSColor.bottomBarSelected]
        appearance.stackedLayoutAppearance = tabBarItemAppearance
        appearance.compactInlineLayoutAppearance = tabBarItemAppearance
        appearance.inlineLayoutAppearance = tabBarItemAppearance

        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
    }

    /**
     레이아웃을 세팅합니다.
     */
    private func setLayouts() {
        tabBar.addSubview(divider)
        divider.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
    }

}

// MARK: - TabBarItem 중앙정렬 관련 세팅

extension YDSBottomBarController {

    /**
     BottomBar에 들어가는 viewController 배열입니다.
     해당 viewController에 할당된 TabBar의 title이 nil인지 아닌지 확인한 후
     title이 nil이라면 image가 자동으로 중앙 정렬 되도록 설정합니다.
     */
    open override var viewControllers: [UIViewController]? {
        didSet { setTabBarItemImageInsets() }
    }

    /**
     viewControllers에 viewController를 추가하는 메소드입니다.
     새로운 viewController 배열이 들어오면
     각 viewController에 할당된 TabBar의 title이 nil인지 아닌지 확인한 후
     title이 nil이라면 image가 자동으로 중앙 정렬 되도록 설정합니다.
     */
    open override func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        super.setViewControllers(viewControllers, animated: true)
        setTabBarItemImageInsets()
    }

    /**
     각 뷰 컨트롤러별 tabBarItem의 title 값이 nil이라면
     imageInsets을 조정해 image가 중앙에 오도록 만들어줍니다.
     */
    public func setTabBarItemImageInsets() {
        viewControllers?.forEach {
            if $0.tabBarItem.title == nil {
                $0.tabBarItem.imageInsets = UIEdgeInsets(top: Dimension.itemImageVerticalInset,
                                                         left: 0,
                                                         bottom: -Dimension.itemImageVerticalInset,
                                                         right: 0)
            }
        }
    }

}

// MARK: - TabBarItem 애니메이션 관련 세팅

extension YDSBottomBarController {

    /**
     각종 애니메이션 관련 수치입니다.
     */
    private enum Transform {
        static let length: TimeInterval = YDSAnimation.Duration.medium
        static let scale: CGFloat = 1.2
        static let dumpingRatio: CGFloat = 0.5
    }

    /**
     각 TabBarItem이 터치되면
     진동을 발생시키고 스프링 애니메이션을 재생합니다.
     */
    open override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if isImpactFeedbackEnabled {
            feedbackGenerator.impactOccurred()
            feedbackGenerator.prepare()
        }

        guard let itemView = item.value(forKey: "view") as? UIView else { return }

        let propertyAnimator = UIViewPropertyAnimator(duration: Transform.length,
                                                      dampingRatio: Transform.dumpingRatio) {
            itemView.transform = CGAffineTransform.identity.scaledBy(x: Transform.scale, y: Transform.scale)
        }
        propertyAnimator.addAnimations({ itemView.transform = .identity },
                                       delayFactor: CGFloat(Transform.length))
        propertyAnimator.startAnimation()
    }

}
