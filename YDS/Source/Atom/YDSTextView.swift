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
    public private(set) var isShowingPlaceholder: Bool = false
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
        super.init(frame: .zero, textContainer: nil)
        showPlaceholderIfNeeded()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        isScrollEnabled = isOverHeight
        invalidateIntrinsicContentSize()
    }
    
    public func hidePlaceholderIfNeeded() {
        if isShowingPlaceholder, attributedText.string == placeholder {
            text = nil
            textColor = YDSColor.textSecondary
            isShowingPlaceholder.toggle()
        }
    }
    
    public func showPlaceholderIfNeeded() {
        if isShowingPlaceholder == false, attributedText.isEmpty {
            text = placeholder
            textColor = YDSColor.textTertiary
            isShowingPlaceholder.toggle()
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
