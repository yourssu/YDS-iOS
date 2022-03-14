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
    
    private let placeholder: String
    private var isPlaceholderShowing: Bool
    private let maxHeight: CGFloat?
    
    private var isOverHeight: Bool {
        guard let maxHeight = maxHeight else { return false }
        return contentSize.height >= maxHeight
    }

    // MARK: - Init
    
    /// placeholder 사용을 위해서 UITextViewDelegate 구현 필수 (스토리북 참고)
    public init(style: String.TypoStyle = .body1, placeholder: String, maxHeight: CGFloat?) {
        self.style = style
        self.placeholder = placeholder
        self.maxHeight = maxHeight
        self.isPlaceholderShowing = false
        super.init(frame: .zero, textContainer: nil)
        showPlaceholderIfNeeded()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        isScrollEnabled = isOverHeight
    }
    
    public func hidePlaceholderIfNeeded() {
        if isPlaceholderShowing, attributedText.string == placeholder {
            text = nil
            textColor = YDSColor.textSecondary
            isPlaceholderShowing.toggle()
        }
    }
    
    public func showPlaceholderIfNeeded() {
        if isPlaceholderShowing == false, attributedText.isEmpty {
            text = placeholder
            textColor = YDSColor.textTertiary
            isPlaceholderShowing.toggle()
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
