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
    }
    

    

}
