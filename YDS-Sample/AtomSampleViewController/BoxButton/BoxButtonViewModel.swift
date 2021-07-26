//
//  BoxButtonViewModel.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/27.
//

import UIKit
import YDS_iOS
import RxSwift

class BoxButtonViewModel {
    let bag = DisposeBag()
        
    let textObservable = BehaviorSubject<String?>(value: "")
    let leftIconObservable = BehaviorSubject<UIImage?>(value: nil)
    let rightIconObservable = BehaviorSubject<UIImage?>(value: nil)
    let typeObservable = BehaviorSubject<YDSBoxButton.BoxButtonType>(value: .filled)
    let sizeObservable = BehaviorSubject<YDSBoxButton.BoxButtonSize>(value: .large)
    let roundingObservable = BehaviorSubject<YDSBoxButton.BoxButtonRounding>(value: .r4)
    let isDisabledObservable = BehaviorSubject<Bool>(value: false)
    let isWarnedObservable = BehaviorSubject<Bool>(value: false)
    
}
