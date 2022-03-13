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
    private let textView = YDSTextView(placeholder: YDSPlaceholder.comment)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
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
        sampleView.addSubviews(textView)
    }
    
    private func setAutolayout() {
        textView.snp.makeConstraints {
            $0.height.greaterThanOrEqualTo(48).priority(999)
            $0.height.lessThanOrEqualTo(maxHeight)
            $0.width.equalTo(282)
            $0.centerX.equalToSuperview()
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

extension TextViewViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textView.contentSize.height >= maxHeight {
            textView.isScrollEnabled = true
        } else {
            textView.isScrollEnabled = false
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        guard let textView = textView as? YDSTextView else { return }
        textView.showPlaceholderIfNeeded()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard let textView = textView as? YDSTextView else { return }
        textView.hidePlaceholderIfNeeded()
    }
}
