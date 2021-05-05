//
//  YDSLabel.swift
//  YDS-iOS
//
//  Created by 김윤서 on 2021/05/05.
//

import UIKit

public class YDSLabel: UILabel{
    private var style : String.YDSTextStyle
    
    public init(style:  String.YDSTextStyle) {
        self.style = style
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override var text: String? {
        didSet {
            if let text = self.text {
                self.attributedText = text.attributedString(byPreset: style)
            }
        }
    }

    public override var textColor: UIColor!{
        didSet{
            if let text = self.text {
                self.attributedText = text.attributedString(byPreset: style, color: textColor)
            }
        }
    }
}
