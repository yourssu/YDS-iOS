//
//  YDSLabel.swift
//  YDS-iOS
//
//  Created by 김윤서 on 2021/05/05.
//

import UIKit

public class YDSLabel: UILabel {
    public var style : String.TypoStyle {
        didSet { setAttributedText() }
    }
    
    public init(style: String.TypoStyle) {
        self.style = style
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override var text: String? {
        didSet { setAttributedText() }
    }

    public override var textColor: UIColor! {
        didSet { setAttributedText() }
    }
    
    private func setAttributedText() {
        if let text = self.text {
            if let color = textColor {
                self.attributedText = text.attributedString(byPreset: style, color: color)
            } else {
                self.attributedText = text.attributedString(byPreset: style)
            }
        }
    }
}

