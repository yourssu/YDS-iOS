//
//  YDSTextView.swift
//  YDS
//
//  Created by 강민석 on 2022/03/13.
//

import UIKit

public class YDSTextView: UITextView {
    public var style : String.TypoStyle {
        didSet { setAttributedText() }
    }
    
    public override var text: String? {
        didSet { setAttributedText() }
    }
    
    public override var textColor: UIColor! {
        didSet { setAttributedText() }
    }
    
    public var lineBreakMode: NSLineBreakMode? {
        didSet { setAttributedText() }
    }
    
    public var lineBreakStrategy: NSParagraphStyle.LineBreakStrategy? {
        didSet { setAttributedText() }
    }
    
    private let placeholder: String?

    // MARK: - Init

    public init(style: String.TypoStyle = .body1, placeholder: String? = nil) {
        self.style = style
        self.placeholder = placeholder
        super.init(frame: .zero, textContainer: nil)
        showPlaceholderIfNeeded()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func hidePlaceholderIfNeeded() {
        if attributedText.string == placeholder {
            text = nil
            textColor = YDSColor.textSecondary
        }
    }
    
    public func showPlaceholderIfNeeded() {
        if attributedText.isEmpty {
            text = placeholder
            textColor = YDSColor.textTertiary
        }
    }
    
    private func setAttributedText() {
        guard let text = self.text else { return }
        attributedText = text.attributedString(byPreset: style,
                                                color: textColor,
                                                lineBreakMode: lineBreakMode,
                                                lineBreakStrategy: lineBreakStrategy)
    }
}
