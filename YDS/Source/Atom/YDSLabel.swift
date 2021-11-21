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
    
    public override var text: String? {
        didSet { setAttributedText() }
    }

    public override var textColor: UIColor! {
        didSet { setAttributedText() }
    }
    
    public override var lineBreakMode: NSLineBreakMode {
        didSet { setAttributedText() }
    }
    
    public override var lineBreakStrategy: NSParagraphStyle.LineBreakStrategy {
        didSet { setAttributedText() }
    }
    
    public init(style: String.TypoStyle = .body1) {
        self.style = style
        super.init(frame: CGRect.zero)
        
        if #available(iOS 14.0, *) {
            self.lineBreakStrategy = .hangulWordPriority
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setAttributedText() { 
        guard let text = self.text else { return }
        attributedText = text.attributedString(byPreset: style,
                                               color: textColor,
                                               lineBreakMode: lineBreakMode,
                                               lineBreakStrategy: lineBreakStrategy)
    }
}

