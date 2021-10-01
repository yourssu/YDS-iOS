//
//  YDSSimpleTextFieldView.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/07/19.
//

import UIKit

/**
 가장 기본적인 TextField입니다.
 */
public class YDSSimpleTextFieldView: UIView {
    
    //  MARK: - 외부에서 지정할 수 있는 속성
    
    ///  필드를 비활성화 시킬 때 사용합니다.
    public var isDisabled: Bool = false {
        didSet {
            setState()
            textField.isDisabled = self.isDisabled
        }
    }
    
    ///  필드에 들어온 입력이 잘못되었음을 알릴 때 사용합니다.
    public var isNegative: Bool = false {
        didSet {
            setState()
            textField.isNegative = self.isNegative
        }
    }

    ///  필드에 들어온 입력이 제대로 되었음을 알릴 때 사용합니다.
    public var isPositive: Bool = false {
        didSet {
            setState()
            textField.isPositive = self.isPositive
        }
    }
    
    ///  필드에 입력된 텍스트입니다.
    public var text: String? {
        get { return textField.text }
        set { textField.text = newValue }
    }
    
    ///  필드에 나타나는 placeholder의 텍스트입니다.
    public var placeholder: String? {
        get { return textField.placeholder }
        set { textField.placeholder = newValue }
    }
    
    ///  필드 위쪽에 나타나는 fieldLabel의 텍스트입니다.
    ///  nil이 들어오면 fieldLabel이 사라집니다.
    public var fieldLabelText: String? {
        get { return fieldLabel.text }
        
        set {
            fieldLabel.text = newValue
            
            if newValue == nil {
                fieldLabel.isHidden = true
            } else {
                fieldLabel.isHidden = false
            }
        }
    }
    
    ///  필드 아래쪽에 나타나는 helperLabel의 텍스트입니다.
    ///  nil이 들어오면 helperLabel이 사라집니다.
    public var helperLabelText: String? {
        get { return helperLabel.text }
        set {
            helperLabel.text = newValue
            
            if newValue == nil {
                helperLabel.isHidden = true
            } else {
                helperLabel.isHidden = false
            }
        }
    }
    
    
    //  MARK: - 외부에서 재생할 수 있는 함수
    
    /**
     필드가 좌우로 흔들리는 애니메이션을 재생합니다.
     withHatic이 true면 진동도 함께 재생합니다.
     */
    public func shake(withHaptic: Bool) {
        if withHaptic { playHaptic() }
        playWarningAnimation()
    }
    
    
    //  MARK: - 진동 관련 인스턴스
    
    /**
     각 Item을 Touch 했을 때 진동이 울리도록 만들어주는 feedbackGenerator입니다.
     */
    private let feedbackGenerator = UINotificationFeedbackGenerator()
    

    //  MARK: - 뷰
    
    ///  fieldLabel, textField, helperLabel을 담는 stackView입니다.
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = YDSTextFieldView.Dimension.subviewSpacing
        return stackView
    }()
    
    ///  필드 위쪽에 나타나는 fieldLabel입니다.
    private let fieldLabel = YDSLabel(style: .subtitle3)
    
    ///  필드 중앙의 실제 입력 필드입니다.
    ///  public으로 열려있으니 delegate를 등록하거나 addTarget, endEditing 등의 메소드를 호출할 때
    ///  simpleTextField.delegate 대신 simpleTextField.textField.delegate 로 접근해주세요.
    public let textField: YDSSimpleTextField = {
        let textField = YDSSimpleTextField()
        return textField
    }()
    
    ///  필드 아래쪽에 나타나는 helperLabel입니다.
    private let helperLabel = YDSLabel(style: .caption1)
    
    
    // MARK: - 메소드
    
    public init() {
        super.init(frame: CGRect.zero)
        feedbackGenerator.prepare()
        
        setStackView()
        setState()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///  stackView 내부를 세팅합니다.
    private func setStackView() {
        self.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.bottom.left.right.equalToSuperview()
        }
        
        stackView.addArrangedSubview(fieldLabel)
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(helperLabel)
        
        fieldLabel.snp.makeConstraints {
            $0.width.equalToSuperview()
        }
        textField.snp.makeConstraints {
            $0.width.equalToSuperview()
        }
        helperLabel.snp.makeConstraints {
            $0.width.equalToSuperview().offset(-YDSTextFieldView.Dimension.helperLabelHorizontalMargin*2)
        }
    }
    
    ///  필드의 상태를 세팅합니다.
    ///  우선순위는 isDisabled > isNegative > isPositive 입니다.
    private func setState() {
        if self.isDisabled {
            fieldLabel.textColor = YDSColor.textDisabled
            helperLabel.textColor = YDSColor.textDisabled
            return
        }
        
        if self.isNegative {
            fieldLabel.textColor = YDSColor.textSecondary
            helperLabel.textColor = YDSColor.textWarned
            return
        }
        
        if self.isPositive {
            fieldLabel.textColor = YDSColor.textSecondary
            helperLabel.textColor = YDSColor.textTertiary
            return
        }
        
        fieldLabel.textColor = YDSColor.textSecondary
        helperLabel.textColor = YDSColor.textTertiary
    }
    
}


//  MARK: - Warning 애니메이션 관련 세팅

extension YDSSimpleTextFieldView {
    /**
     각종 애니메이션 관련 수치입니다.
     */
    private enum Transform {
        static let length: TimeInterval = Animation.Duration.medium
        static var deltaX: CGFloat { Screen.width * 0.02 }
        static let dumpingRatio: CGFloat = 0.5
    }
 
    private func playWarningAnimation() {
        let propertyAnimator = UIViewPropertyAnimator(duration: Transform.length,
                                                      dampingRatio: Transform.dumpingRatio) {
            self.transform = CGAffineTransform(translationX: -Transform.deltaX, y: 0)
        }
        propertyAnimator.addAnimations({ self.transform = .identity },
                                       delayFactor: CGFloat(Transform.length))
        propertyAnimator.startAnimation()
    }
    
    private func playHaptic() {
        feedbackGenerator.notificationOccurred(.warning)
        feedbackGenerator.prepare()
    }
}
