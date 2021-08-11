//
//  YDSTopBarButton.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/08/09.
//

import UIKit

public class YDSTopBarButton: UIButton {

    public var isDisabled: Bool = false {
        didSet {
            self.isEnabled = !isDisabled
            setColor()
        }
    }
    
    //  isHighlighted: Bool?
    //  기본 속성을 override한 후 didSet을 설정하여
    //  값이 바뀔 때 ( = 버튼을 누르거나 땠을 때 ) 그에 맞춰 색을 바꿔줍니다.
    public override var isHighlighted: Bool {
        didSet {
            if oldValue != isHighlighted {
                setTintColorBasedOnIsHighlighted()
            }
        }
    }
    
    //  MARK: - 내부에서 사용되는 변수

    //  fgColor: UIColor?
    //  버튼의 아이콘, 글자 컬러입니다.
    private var fgColor: UIColor?
    
    //  fgPressedColor: UIColor?
    //  버튼이 pressed 되었을 때 아이콘, 글자 컬러입니다.
    private var fgPressedColor: UIColor?
    
    private enum Dimension {
        enum content {
            static let imageSize: CGFloat = 24
            enum Padding {
                static let horizontal: CGFloat = 8
            }
        }
    }
    
    public init(text: String?) {
        super.init(frame: .zero)
        self.setTitle(text, for: .normal)
        setupView()
    }
    
    public init(image: UIImage?) {
        super.init(frame: .zero)
        self.setImage(image?
                        .resize(to: Dimension.content.imageSize)
                        .withRenderingMode(.alwaysTemplate),
                      for: .normal)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setProperties()
        setColor()
    }
    
    private func setProperties() {
        self.adjustsImageWhenHighlighted = false
        self.adjustsImageWhenDisabled = false

        self.titleLabel?.font = YDSFont.button0
        self.contentEdgeInsets = UIEdgeInsets(top: 0,
                                              left: Dimension.content.Padding.horizontal,
                                              bottom: 0,
                                              right: Dimension.content.Padding.horizontal)
    }
    
    private func setColor() {
        if isDisabled {
            fgColor = YDSColor.buttonDisabled
            fgPressedColor = YDSColor.buttonDisabled
        } else {
            fgColor = YDSColor.buttonNormal
            fgPressedColor = YDSColor.buttonNormalPressed
        }
        
        setTitleColor(fgColor, for: .normal)
        setTitleColor(fgPressedColor, for: .highlighted)
        
        setTintColorBasedOnIsHighlighted()
    }
    
    //  setTintColorBasedOnIsHighlighted()
    //  isHighlighted 값에 맞추어 tintColor를 변경합니다.
    private func setTintColorBasedOnIsHighlighted() {
        self.tintColor = !isHighlighted
            ? fgColor
            : fgPressedColor
    }

}
