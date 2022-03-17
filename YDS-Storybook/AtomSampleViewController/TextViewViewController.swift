//
//  TextViewViewController.swift
//  YDS-Storybook
//
//  Created by 강민석 on 2022/03/13.
//

import UIKit
import YDS

public enum YDSPlaceholder {
    public static let comment = "댓글을 입력해주세요."
}

class TextViewViewController: StoryBookViewController {
    private lazy var textView = YDSTextView(placeholder: YDSPlaceholder.comment, maxHeight: maxHeight)
    private lazy var titleLabel: YDSLabel = {
        let label = YDSLabel(style: .subtitle2)
        label.textColor = YDSColor.textPrimary
        label.text = "isShowingPlaceholder"
        return label
    }()
    private lazy var stateLabel: YDSLabel = {
        let label = YDSLabel(style: .body2)
        label.textColor = YDSColor.textSecondary
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stateLabel.text = true.description
        
        textView.delegate = self
        textView.placeholderDelegate = self
        textView.isScrollEnabled = false
        textView.isEditable = true
        textView.textContainerInset = .init(top: 12, left: 0, bottom: 12, right: 0)
        
        setupView()
    }
    
    private let maxHeight: CGFloat = 150
    
    private func setupView() {
        setViewProperty()
        setViewLayouts()
    }
    
    private func setViewProperty() {
        title = "TextView"
    }
    
    private func setViewLayouts() {
        setViewHierarchy()
        setAutolayout()
    }
    
    private func setViewHierarchy() {
        sampleView.addSubviews(textView, titleLabel, stateLabel)
    }
    
    private func setAutolayout() {
        textView.snp.makeConstraints {
            $0.height.greaterThanOrEqualTo(48).priority(999)
            $0.height.lessThanOrEqualTo(maxHeight)
            $0.width.equalTo(282)
            $0.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(textView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        stateLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.bottom.equalToSuperview().inset(12)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else { return }
        if touch.view != textView {
            view.endEditing(true)
        }
    }
}

extension TextViewViewController: YDSTextViewPlaceholderDelegate {
    func textView(_ textView: YDSTextView, shouldShowPlaceholder: Bool) {
        stateLabel.text = shouldShowPlaceholder.description
    }
}

extension TextViewViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        guard let textView = textView as? YDSTextView else { return }
        textView.showPlaceholderIfNeeded()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard let textView = textView as? YDSTextView else { return }
        textView.hidePlaceholderIfNeeded()
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let inputString = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let currentString = textView.text,
              let newRange = Range(range, in: currentString) else { return true }
        let newString = currentString.replacingCharacters(in: newRange, with: inputString).trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard newString.count < 500 else {
            YDSToast.makeToast(text: "error: 최대 글자수 초과", duration: .short)
            return false
        }
        return true
    }
}
