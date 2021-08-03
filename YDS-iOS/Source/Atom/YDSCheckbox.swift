//
//  YDSCheckbox.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/08/01.
//

import UIKit

public class YDSCheckbox: UIControl {

    //  MARK: - 외부에서 지정할 수 있는 속성
    
    //  isDisabled: Bool
    //  체크박스를 비활성화 시킬 때 사용합니다.
    public var isDisabled: Bool = false {
        didSet {
            self.isEnabled = !isDisabled
            setColor()
        }
    }

    //  isSelected: Bool
    //  체크박스의 선택 여부를 나타낼 때 사용합니다.
    public override var isSelected: Bool {
        didSet {
            setIconImage()
            setColor()
        }
    }
  
    
    //  size: CheckboxSize ( small, medium, large )
    //  타이포 크기, 아이콘 크기, 아이콘과 라벨 사이 간격을 결정할 때 사용합니다.
    public var size: CheckboxSize = .large {
        didSet { setSize() }
    }
    
    //  text: String?
    //  체크박스의 글귀를 설정할 때 사용합니다.
    public var text: String? = nil {
        didSet { setText() }
    }
    
    
    //  MARK: - 외부에서 접근할 수 있는 enum

    //  CheckboxSize
    //  체크박스의 size 종류입니다.
    //  각 size에 맞는 font, iconSize, spacing을 computed property로 가지고 있습니다.
    public enum CheckboxSize {
        case small
        case medium
        case large
        
        fileprivate var iconSize: YDSIconView.IconSize {
            switch self {
            case .small:
                return  .extraSmall
            case .medium:
                return .small
            case .large:
                return .medium
            }
        }
        
        fileprivate var font: String.TypoStyle {
            switch self {
            case .small:
                return .button4
            case .medium:
                return .button3
            case .large:
                return .button3
            }
        }
        
        fileprivate var spacing: CGFloat {
            switch self {
            case .small:
                return 4
            case .medium:
                return 8
            case .large:
                return 8
            }
        }
    }
    
    
    //  MARK: - 내부에서 사용되는 상수
    
    //  isSelectedTrueIcon: YDSIcon (UIImage)
    //  isSelected 상태가 true임을 나타내는 아이콘입니다.
    private let isSelectedTrueIcon = YDSIcon.checkcircleFilled.withRenderingMode(.alwaysTemplate)
    
    //  isSelectedFalseIcon: YDSIcon (UIImage)
    //  isSelected 상태가 false임을 나타내는 아이콘입니다.
    private let isSelectedFalseIcon = YDSIcon.checkcircleLine.withRenderingMode(.alwaysTemplate)
    
    
    //  MARK: - 뷰
        
    //  stackView: UIStackView
    //  icon과 label을 담는 stackView
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()

    //  label: YDSLabel (UILabel)
    //  체크박스의 글자를 그리는 label입니다.
    private let label = YDSLabel(style: .title1)

    //  iconView: YDSIconView (UIImageView)
    //  체크박스의 아이콘을 그리는 iconView입니다.
    private let iconView = YDSIconView()
    
    
    //  MARK: - 메소드
    
    public init() {
        super.init(frame: .zero)
        setupView()
        registerTapAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setViewHierarchy()
        setAutolayout()
        
        setIconImage()
        setText()
        setSize()
        setColor()
    }
    
    private func setViewHierarchy() {
        self.addSubview(stackView)
        
        [iconView, label].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    private func setAutolayout() {
        stackView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setIconImage() {
        self.iconView.image = isSelected
            ? isSelectedTrueIcon
            : isSelectedFalseIcon
    }
    
    private func setText() {
        self.label.text = text
        self.label.isHidden = (text == nil)
    }
    
    private func setSize() {
        stackView.spacing = size.spacing
        iconView.size = size.iconSize
        label.style = size.font
    }
    
    private func setColor() {
        if isDisabled {
            iconView.tintColor = YDSColor.buttonDisabled
            label.textColor = YDSColor.buttonDisabled
            return
        }
        
        if isSelected {
            iconView.tintColor = YDSColor.buttonPoint
            label.textColor = YDSColor.buttonPoint
            return
        }
        
        iconView.tintColor = YDSColor.buttonNormal
        label.textColor = YDSColor.buttonNormal
    }
    
    private func registerTapAction() {
        [stackView, iconView, label].forEach {
            $0.isUserInteractionEnabled = false
        }
        self.addTarget(self,
                       action: #selector(checkboxDidTap(_:)),
                       for: .touchUpInside
        )
    }
    
    @objc
    private func checkboxDidTap(_ sender: UIControl) {
        self.isSelected = !isSelected
    }

}
