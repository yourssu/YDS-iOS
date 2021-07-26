//
//  BoxButtonViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/27.
//

import UIKit
import YDS_iOS
import RxSwift
import SnapKit

class BoxButtonViewController: StoryBookViewController {
    
    let viewModel = BoxButtonViewModel()
    let bag = DisposeBag()
    
    let sampleButton: YDSBoxButton = {
        let button = YDSBoxButton()
        return button
    }()
    
    let textInputView: OptionalStringInputView = {
        let inputView = OptionalStringInputView()
        inputView.parameterLabel.text = "text"
        inputView.isDisabled = false
        return inputView
    }()
    
    let leftImageInputView: OptionalImageInputView = {
        let inputView = OptionalImageInputView(cases: [YDSIcon.playcircleFilled, YDSIcon.groundFilled])
        inputView.parameterLabel.text = "leftImage"
        return inputView
    }()
    
    let rightImageInputView: OptionalImageInputView = {
        let inputView = OptionalImageInputView(cases: [YDSIcon.playcircleFilled, YDSIcon.groundFilled])
        inputView.parameterLabel.text = "rightImage"
        return inputView
    }()
    
    let typeInputView: EnumInputView<YDSBoxButton.BoxButtonType> = {
        let inputView = EnumInputView(cases: YDSBoxButton.BoxButtonType.allCases)
        inputView.parameterLabel.text = "type"
        return inputView
    }()
    
    let sizeInputView: EnumInputView<YDSBoxButton.BoxButtonSize> = {
        let inputView = EnumInputView(cases: YDSBoxButton.BoxButtonSize.allCases)
        inputView.parameterLabel.text = "size"
        return inputView
    }()
    
    let roundingInputView: EnumInputView<YDSBoxButton.BoxButtonRounding> = {
        let inputView = EnumInputView(cases: YDSBoxButton.BoxButtonRounding.allCases)
        inputView.parameterLabel.text = "rounding"
        return inputView
    }()
    
    let isDisabledInputView: BoolInputView = {
        let inputView = BoolInputView()
        inputView.parameterLabel.text = "isDisabled"
        return inputView
    }()
    
    let isWarnedInputView: BoolInputView = {
        let inputView = BoolInputView()
        inputView.parameterLabel.text = "isWarned"
        return inputView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        setViewProperty()
        setViewHierarchy()
        setAutolayout()
        bindView()
    }
    
    private func setViewProperty() {
        self.title = "BoxButton"
    }
    
    private func setViewHierarchy() {
        sampleView.addSubview(sampleButton)
        stackView.addArrangedSubview(textInputView)
        stackView.addArrangedSubview(leftImageInputView)
        stackView.addArrangedSubview(rightImageInputView)
        stackView.addArrangedSubview(typeInputView)
        stackView.addArrangedSubview(sizeInputView)
        stackView.addArrangedSubview(roundingInputView)
        stackView.addArrangedSubview(isDisabledInputView)
        stackView.addArrangedSubview(isWarnedInputView)
    }
    
    private func setAutolayout() {
        sampleButton.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    private func bindView() {
        viewModel.textObservable
            .subscribe(onNext: { value in
                self.sampleButton.text = value
            })
            .disposed(by: bag)
        
        viewModel.leftIconObservable
            .subscribe(onNext: { value in
                self.sampleButton.leftIcon = value
            })
            .disposed(by: bag)
        
        viewModel.rightIconObservable
            .subscribe(onNext: { value in
                self.sampleButton.rightIcon = value
            })
            .disposed(by: bag)
        
        viewModel.typeObservable
            .subscribe(onNext: { value in
                self.sampleButton.type = value
            })
            .disposed(by: bag)
        
        viewModel.sizeObservable
            .subscribe(onNext: { value in
                self.sampleButton.size = value
            })
            .disposed(by: bag)
        
        viewModel.roundingObservable
            .subscribe(onNext: { value in
                self.sampleButton.rounding = value
            })
            .disposed(by: bag)
        
        viewModel.isDisabledObservable
            .subscribe(onNext: { value in
                self.sampleButton.isDisabled = value
            })
            .disposed(by: bag)
        
        viewModel.isWarnedObservable
            .subscribe(onNext: { value in
                self.sampleButton.isWarned = value
            })
            .disposed(by: bag)
        
        textInputView.observable
            .subscribe(onNext: { value in
                self.viewModel.textObservable.onNext(value)
            })
            .disposed(by: bag)
        
        leftImageInputView.observable
            .subscribe(onNext: { value in
                self.viewModel.leftIconObservable.onNext(value)
            })
            .disposed(by: bag)
        
        rightImageInputView.observable
            .subscribe(onNext: { value in
                self.viewModel.rightIconObservable.onNext(value)
            })
            .disposed(by: bag)
        
        typeInputView.observable
            .subscribe(onNext: { value in
                self.viewModel.typeObservable.onNext(value)
            })
            .disposed(by: bag)
        
        sizeInputView.observable
            .subscribe(onNext: { value in
                self.viewModel.sizeObservable.onNext(value)
            })
            .disposed(by: bag)
        
        roundingInputView.observable
            .subscribe(onNext: { value in
                self.viewModel.roundingObservable.onNext(value)
            })
            .disposed(by: bag)
        
        isDisabledInputView.observable
            .subscribe(onNext: { value in
                self.viewModel.isDisabledObservable.onNext(value)
            })
            .disposed(by: bag)
        
        isWarnedInputView.observable
            .subscribe(onNext: { value in
                self.viewModel.isWarnedObservable.onNext(value)
            })
            .disposed(by: bag)
    }

}


extension YDSBoxButton.BoxButtonType: CaseIterable {
    public static var allCases: [YDSBoxButton.BoxButtonType] = [.filled, .tinted, .line]
}

extension YDSBoxButton.BoxButtonSize: CaseIterable {
    public static var allCases: [YDSBoxButton.BoxButtonSize] = [.extraLarge, .large, .medium, .small]
}

extension YDSBoxButton.BoxButtonRounding: CaseIterable {
    public static var allCases: [YDSBoxButton.BoxButtonRounding] = [.r8, .r4]
}
