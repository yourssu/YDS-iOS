//
//  YDSToast.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/08/04.
//

import UIKit

public class YDSToast: UIView {
    
    private var text: String? {
        get {
            return label.text
        }
        set (inputValue) {
            label.text = inputValue
        }
    }
    
    private var duration: ToastDuration
    
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
        
    private let label: YDSLabel = {
        let label = YDSLabel(style: .body2)
        label.textColor = YDSColor.textReversed
        label.allowsDefaultTighteningForTruncation = true
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        return label
    }()
    
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
    
    private init(text: String?, duration: ToastDuration) {
        self.duration = duration
        self.label.text = text
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setLayouts()
        setProperties()
    }
    
    private func setLayouts() {
        setViewHierarchy()
        setAutolayout()
    }
    
    private func setViewHierarchy() {
        self.addSubview(label)
    }
    
    private func setAutolayout() {
        label.snp.makeConstraints {
            $0.width.lessThanOrEqualToSuperview().offset(-Dimension.Padding.horizontal*2)
            $0.height.equalToSuperview().offset(-Dimension.Padding.vertical*2)
            $0.center.equalToSuperview()
        }
    }
    
    private func setProperties() {
        //  이거 임의로 해둔거고 새로 토스트용 컬러 만들어야 함!!!
        //  디자이너가 일 안함!!!
        self.backgroundColor = YDSColor.textSecondary
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        self.alpha = 0.0
    }
    
    public static func makeToast(text: String?, duration: ToastDuration = .long, at superview: UIView) {
        let toast = YDSToast(text: text,
                             duration: duration)
        
        superview.addSubview(toast)
        toast.snp.makeConstraints {
            $0.bottom.equalTo(superview.safeAreaLayoutGuide.snp.bottom).offset(-Dimension.Margin.vertical)
            $0.width.equalToSuperview().offset(-Dimension.Margin.horizontal*2)
            $0.centerX.equalToSuperview()
        }
        
        toast.showToast()
    }
    
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
    
    private func removeToast() {
        self.removeFromSuperview()
    }
    
}
