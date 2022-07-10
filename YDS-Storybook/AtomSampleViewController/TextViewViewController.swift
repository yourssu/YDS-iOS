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
    
    private(set) lazy var inputStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .bottom
        stackView.backgroundColor = YDSColor.inputFieldElevated
        stackView.spacing = 8
        return stackView
    }()
    
    private(set) lazy var imageView: YDSProfileImageView = {
        let profileImageView = YDSProfileImageView()
        profileImageView.image = UIImage(named: "logo.png")
        profileImageView.size = .medium
        return profileImageView
    }()
    
    private(set) lazy var writingButton: YDSPlainButton = {
        let button = YDSPlainButton()
        button.rightIcon = YDSIcon.penFilled
        button.setContentCompressionResistancePriority(.defaultHigh + 1, for: .horizontal)
        return button
    }()
    
    private lazy var textView = YDSTextView(maxHeight: maxHeight)
    private lazy var titleLabel: YDSLabel = {
        let label = YDSLabel(style: .subtitle2)
        label.textColor = YDSColor.textPrimary
        label.text = "TextView.text.isEmpty"
        return label
    }()
    private lazy var stateLabel: YDSLabel = {
        let label = YDSLabel(style: .body2)
        label.textColor = YDSColor.textSecondary
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        textView.isScrollEnabled = false
        textView.isEditable = true
        textView.textContainerInset = .init(top: 12, left: 0, bottom: 12, right: 0)
        textView.placeholder = YDSPlaceholder.comment
        
        setupView()
        stateLabel.text = textView.attributedText.isEmpty.description
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
        inputStackView.addArrangedSubviews(imageView, textView, writingButton)
        sampleView.addSubviews(inputStackView, titleLabel, stateLabel)
    }
    
    private func setAutolayout() {
        inputStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(8)
        }

        textView.snp.makeConstraints {
            $0.height.lessThanOrEqualTo(maxHeight)
            $0.height.greaterThanOrEqualTo(48)
        }

        writingButton.snp.makeConstraints {
            $0.width.equalTo(44)
            $0.height.equalTo(48)
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

extension TextViewViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        guard let textView = textView as? YDSTextView else { return }
        stateLabel.text = textView.attributedText.isEmpty.description
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
