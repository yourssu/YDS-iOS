//
//  StorybookPageViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/27.
//

import UIKit
import YDS_iOS
import SnapKit
import RxSwift

class StoryBookViewController: UIViewController {
    
    let bag = DisposeBag()

    let sampleView: UIView = {
        let view = UIView()
        view.backgroundColor = YDSColor.monoItemBG
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
    
    private func setUI() {
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
        scrollView.snp.makeConstraints {
            $0.top.equalTo(sampleView.snp.bottom)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
        scrollView.contentLayoutGuide.snp.makeConstraints {
            $0.top.equalTo(sampleView.snp.bottom)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-32)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    
    //  MARK: - 키보드 올릴 때 스크롤뷰가 자동으로 스크롤 되도록 만들어 텍스트 필드를 가리지 않게 함

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
    
    
    // MARK: - 배경을 터치했을 때 키보드가 내려가도록 함
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        stackView.arrangedSubviews.forEach {
            $0.endEditing(true)
        }
    }
    
    
    //  MARK: - 옵션 추가를 위한 함수
    
    //  Optional String
    public func addOption(description: String?, defaultValue: String?,  task: @escaping (String?) -> Void) {
        let controllerView: OptionalStringControllerView = {
            let controllerView = OptionalStringControllerView()
            controllerView.parameterLabel.text = description
            return controllerView
        }()
        
        setControllerView(controllerView, defaultValue: defaultValue, task: task)
    }
    
    //  Optional Image
    public func addOption(description: String?, cases: [UIImage?], defaultIndex: Int?,  task: @escaping (UIImage?) -> Void) {
        let controllerView: OptionalImageControllerView = {
            let controllerView = OptionalImageControllerView(cases: cases, defaultIndex: defaultIndex)
            controllerView.parameterLabel.text = description
            return controllerView
        }()
        
        if let index = defaultIndex {
            setControllerView(controllerView, defaultValue: cases[index], task: task)
        } else {
            setControllerView(controllerView, defaultValue: nil, task: task)
        }
    }
    
    //  Enum
    public func addOption<T>(description: String?, cases: [T], defaultIndex: Int,  task: @escaping (T) -> Void) {
        let controllerView: EnumControllerView<T> = {
            let controllerView = EnumControllerView(cases: cases, defaultIndex: defaultIndex)
            controllerView.parameterLabel.text = description
            return controllerView
        }()

        setControllerView(controllerView, defaultValue: cases[defaultIndex], task: task)
    }
    
    //  Bool
    public func addOption(description: String?, defaultValue: Bool,  task: @escaping (Bool) -> Void) {
        let controllerView: BoolControllerView = {
            let controllerView = BoolControllerView()
            controllerView.parameterLabel.text = description
            return controllerView
        }()

        setControllerView(controllerView, defaultValue: defaultValue, task: task)
    }
    
    //  공통
    private func setControllerView<T> (_ controllerView: ControllerView<T>, defaultValue: T, task: @escaping (T) -> Void) {
        self.stackView.addArrangedSubview(controllerView)
        
        controllerView.observable.subscribe(onNext: { value in
            task(value)
        })
        .disposed(by: bag)
        
        controllerView.observable.onNext(defaultValue)
    }

}
