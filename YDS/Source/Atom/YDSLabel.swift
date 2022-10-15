//
//  YDSLabel.swift
//  YDS-iOS
//
//  Created by 김윤서 on 2021/05/05.
//

import UIKit

public class YDSLabel: UILabel {
    @SetNeeds(.layout) public var style: String.TypoStyle = .body1

    public override var text: String? {
        didSet { layoutIfNeeded() }
    }

    public override var textColor: UIColor! {
        didSet { setNeedsLayout() }
    }

    public override var lineBreakMode: NSLineBreakMode {
        didSet { setNeedsLayout() }
    }

    public override var lineBreakStrategy: NSParagraphStyle.LineBreakStrategy {
        didSet { setNeedsLayout() }
    }

    public var alignment: NSTextAlignment {
        didSet { setNeedsLayout() }
    }

    public init(style: String.TypoStyle = .body1) {
        self.style = style
        self.alignment = .left
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
                                               lineBreakStrategy: lineBreakStrategy,
                                               alignment: alignment)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        setAttributedText()
    }
}
