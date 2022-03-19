//
//  YDSTextView.swift
//  YDS
//
//  Created by 강민석 on 2022/03/13.
//

import UIKit
import SnapKit

public class YDSTextView: UITextView {
    public var style: String.TypoStyle {
        didSet { setTextStyle() }
    }
    
    public override var text: String? {
        didSet { textDidChange() }
    }
    
    public override var attributedText: NSAttributedString? {
        didSet { textDidChange() }
    }
    
    public override var textColor: UIColor! {
        didSet { setTextStyle() }
    }
    
    public var lineBreakMode: NSLineBreakMode? {
        didSet { setTextStyle() }
    }
    
    public var lineBreakStrategy: NSParagraphStyle.LineBreakStrategy? {
        didSet { setTextStyle() }
    }
    
    public var placeholder: String? {
        didSet {
            if let placeholder = placeholder {
                registerPlaceholder(placeholder)
            } else {
                removePlaceholder()
            }
        }
    }
    
    public var placeholderColor: UIColor = YDSColor.textTertiary {
        didSet { placeholderLabel?.textColor = placeholderColor }
    }
    
    private var placeholderLabel: YDSLabel?
    private let maxHeight: CGFloat?
    
    // MARK: - Init, LifeCycle
    
    public init(style: String.TypoStyle = .body1, maxHeight: CGFloat? = nil) {
        self.style = style
        self.maxHeight = maxHeight
        super.init(frame: .zero, textContainer: nil)
        setTextStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        removePlaceholder()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        isScrollEnabled = isOverHeight
        invalidateIntrinsicContentSize()
    }
    
    // MARK: - Public func
    
    /// textContainerInset이나 textContainer.lineFragmentPadding 변경시에 호출해야함
    public func setNeedsPlaceholderInset() {
        updatePlaceholderInset(placeholderInset)
    }
    
    /// invalidatePlaceholderInset로 해결되지 않을 경우
    /// 혹은 custom이 필요할 때
    public func changePlaceholderInset(_ inset: UIEdgeInsets) {
        updatePlaceholderInset(inset)
    }
    
    private func updatePlaceholderInset(_ inset: UIEdgeInsets) {
        placeholderLabel?.snp.updateConstraints {
            $0.edges.equalToSuperview().inset(inset)
        }
    }
    
    // MARK: - Private
    
    private func registerPlaceholder(_ text: String) {
        if let placeholderLabel = placeholderLabel {
            placeholderLabel.text = text
        } else {
            placeholderLabel = makePlaceholder(text)
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(textDidChange),
                                                   name: UITextView.textDidChangeNotification,
                                                   object: nil)
        }
    }
    
    private func makePlaceholder(_ text: String) -> YDSLabel {
        let label = YDSLabel(style: style)
        label.text = text
        label.textColor = placeholderColor
        
        self.addSubview(label)
        label.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(placeholderInset)
        }
        return label
    }
    
    private func removePlaceholder() {
        placeholderLabel = nil
        NotificationCenter.default.removeObserver(self, name: UITextView.textDidChangeNotification, object: nil)
    }
    
    private var placeholderInset: UIEdgeInsets {
        var inset = textContainerInset
        inset.left += textContainer.lineFragmentPadding
        return inset
    }
    
    private var isOverHeight: Bool {
        guard let maxHeight = maxHeight else { return false }
        return contentSize.height >= maxHeight
    }
    
    private func setTextStyle() {
        typingAttributes = style.style(color: textColor,
                                       lineBreakMode: lineBreakMode,
                                       lineBreakStrategy: lineBreakStrategy)
    }
    
    @objc
    private func textDidChange() {
        placeholderLabel?.isHidden = !attributedText.isEmpty
    }
}
