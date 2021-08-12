//
//  YDSToast.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/08/04.
//

import UIKit

/**
 Toast를 생성해주는 클래스입니다.
 
 # 주의
 이 클래스 자체를 init하지 않고
 YDSToast.makeToast() 함수를 이용해 Toast를 생성합니다.
 */
public class YDSToast: UIView {
    
    //  MARK: - 내부에서 사용되는 변수 및 상수
    
    /**
     Toast에 나타나는 글자의 String 값입니다.
     */
    private var text: String? {
        get {
            return label.text
        }
        set (inputValue) {
            label.text = inputValue
        }
    }
    
    /**
     Toast의 지속시간입니다.
     */
    private var duration: ToastDuration
    
    /**
     Toast의 지속시간에 관한 enum입니다.
     */
    public enum ToastDuration {
        case short
        case long
        
        fileprivate var value: Double {
            switch(self) {
            case .short:
                return 1.5
            case .long:
                return 3
            }
        }
    }
    
    /**
     내부에서 사용되는 각종 레이아웃 관련 수치입니다.
     */
    private enum Dimension {
        enum Margin {
            static let horizontal = 8
            static let vertical = 16
        }
        
        enum Padding {
            static let horizontal = 24
            static let vertical = 20
        }
    }
    
    
    //  MARK: - 뷰
    
    /**
     Toast에 나타나는 글자의 Label입니다.
     */
    private let label: YDSLabel = {
        let label = YDSLabel(style: .body2)
        label.textColor = YDSColor.textReversed
        label.numberOfLines = 0
        return label
    }()
    
    /**
     생성자는 private으로 막혀있습니다.
     생성자 대신 static으로 정의된 makeToast() 함수를 사용해주세요.
     */
    private init(text: String?, duration: ToastDuration) {
        self.duration = duration
        super.init(frame: .zero)
        self.text = text
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     뷰를 세팅합니다.
     */
    private func setupView() {
        setLayouts()
        setProperties()
    }
    
    /**
     레이아웃을 세팅합니다.
     */
    private func setLayouts() {
        setViewHierarchy()
        setAutolayout()
    }
    
    /**
     뷰의 위계를 세팅합니다.
     */
    private func setViewHierarchy() {
        self.addSubview(label)
    }
    
    /**
     뷰의 오토레이아웃을 세팅합니다.
     label의 width에 lessThanOrEqualToSuperview() 를 사용했기 때문에
     label이 1줄일 때는 중앙정렬, 2줄 이상일 때는 좌측정렬이 됩니다.
     */
    private func setAutolayout() {
        label.snp.makeConstraints {
            $0.width.lessThanOrEqualToSuperview().inset(Dimension.Padding.horizontal)
            $0.height.equalToSuperview().inset(Dimension.Padding.vertical)
            $0.center.equalToSuperview()
        }
    }
    
    /**
     뷰의 프로퍼티를 세팅합니다.
     */
    private func setProperties() {
        self.backgroundColor = YDSColor.toastBG
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        self.alpha = 0.0
    }
    
    
    //  MARK: - Toast Lifecycle
    
    /**
     Toast를 생성하는 함수입니다.
     함수가 실행되면 화면 내 적절한 위치에 Toast가 생성됩니다.
     
     - Parameters:
         - text: Toast에 나타날 글귀입니다.
         - duration: Toast가 지속되는 시간입니다. .short는 1.5초, .long은 3초입니다.
         - superview: Toast가 나타날 view 입니다. 해당 view의 하단에 Toast가 생성됩니다.
     
     ```
     YDSToast.makeToast(text: "Toast 내용",
                        duration: .long,
                        at: myView)
     ```
     */
    public static func makeToast(text: String?, duration: ToastDuration = .long, at superview: UIView) {
        if text == nil || text == "" {
            return
        }
        
        let toast = YDSToast(text: text,
                             duration: duration)
        
        superview.addSubview(toast)
        toast.snp.makeConstraints {
            $0.bottom.equalTo(superview.safeAreaLayoutGuide.snp.bottom).inset(Dimension.Margin.vertical)
            $0.leading.trailing.equalTo(superview.safeAreaLayoutGuide).inset(Dimension.Margin.horizontal)
            $0.centerX.equalToSuperview()
        }
        
        toast.showToast()
    }
    
    /**
     Toast의 alpha 값을 0.0에서 1.0으로 변경하여 Toast가 보이도록 만듭니다.
     */
    private func showToast() {
        UIView.animate(
            withDuration: Animation.Duration.medium,
            delay: 0.0,
            options: .curveEaseIn,
            animations:{
                self.alpha = 1.0
            }, completion: { _ in
                self.hideToastAfterDuration()
            })
    }
    
    /**
     Duration으로 설정한 시간동안 Toast를 유지한 후
     alpha 값을 1.0에서 0.0으로 변경하여 Toast가 사라지도록 만듭니다.
     */
    private func hideToastAfterDuration() {
        UIView.animate(
            withDuration: Animation.Duration.medium,
            delay: self.duration.value,
            options: .curveEaseOut,
            animations: {
                self.alpha = 0.0
            }, completion: { _ in
                self.removeToast()
            })
    }
    
    /**
     토스트를 제거합니다.
     */
    private func removeToast() {
        self.removeFromSuperview()
    }
    
}
