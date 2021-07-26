//
//  StorybookPageViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/27.
//

import UIKit
import YDS_iOS
import SnapKit

class StoryBookViewController: UIViewController {

    let sampleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 248/255, green: 249/255, blue: 250/255, alpha: 1)
        return view
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = YDSColor.bgElevated
        return scrollView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setNotification()
    }
    
    private func setUI(){
        self.view.backgroundColor = YDSColor.bgNormal
        setViewHierarchy()
        setAutolayout()
    }
    
    private func setViewHierarchy() {
        self.view.addSubview(sampleView)
        self.view.addSubview(scrollView)
        scrollView.addSubview(stackView)
    }
    
    private func setAutolayout() {
        sampleView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(Screen.width * 3/4)
        }
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(sampleView.snp.bottom)
            make.leading.trailing.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        scrollView.contentLayoutGuide.snp.makeConstraints { (make) in
            make.top.equalTo(sampleView.snp.bottom)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        stackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().offset(-24)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    private func setNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name:UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name:UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc func keyboardWillShow(notification:NSNotification) {
        guard let keyboardFrame = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        scrollView.contentInset.bottom = view.convert(keyboardFrame.cgRectValue, from: nil).size.height
        
    }

    @objc func keyboardWillHide(notification:NSNotification) {
        scrollView.contentInset.bottom = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        stackView.arrangedSubviews.forEach {
            $0.endEditing(true)
        }
    }

}
