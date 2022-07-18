//
//  SetNeedsLayout.swift
//  YDS
//
//  Created by Yonghyun on 2022/07/17.
//

import UIKit

@available(iOS, introduced: 13, deprecated: 15, message: "iOS 15 이상의 버전에서는 @Invalidating property wrapper를 사용해주세요")
@propertyWrapper
public struct SetNeedsLayout<Value: Equatable> {
    private var value: Value
    
    public init(wrappedValue: Value) {
        self.value = wrappedValue
    }
    
    @available(*, unavailable, message: "이 속성에는 직접 접근 금지")
    public var wrappedValue: Value {
        get { fatalError("@SetNeedsLayout wrappedValue get 호출") }
        set { fatalError("@SetNeedsLayout wrappedValue set 호출") }
    }
    
    public static subscript<EnclosingSelf: UIView>(
        _enclosingInstance observed: EnclosingSelf,
        wrapped wrappedKeyPath: ReferenceWritableKeyPath<EnclosingSelf, Value>,
        storage storageKeyPath: ReferenceWritableKeyPath<EnclosingSelf, Self>
    ) -> Value {
        get {
            observed[keyPath: storageKeyPath].value
        }
        set {
            let oldValue = observed[keyPath: storageKeyPath].value
            guard newValue != oldValue else { return }
            
            observed[keyPath: storageKeyPath].value = newValue
            observed.setNeedsLayout()
        }
    }
}

//
//  SetNeedsLayout.swift
//  YDS
//
//  Created by Yonghyun on 2022/07/17.
//

import UIKit

@propertyWrapper
public final class SetNeedsLayout<Value> where Value: Equatable {
    
    private var stored: Value
    
    public static subscript<EnclosingSelf>(
        _enclosingInstance observed: EnclosingSelf,
        wrapped wrappedKeyPath: ReferenceWritableKeyPath<EnclosingSelf, Value>,
        storage storageKeyPath: ReferenceWritableKeyPath<EnclosingSelf, SetNeedsLayout>
    ) -> Value where EnclosingSelf: UIView {
        get {
            return observed[keyPath: storageKeyPath].stored
        }
        set {
            let oldValue = observed[keyPath: storageKeyPath].stored
            
            if newValue != oldValue {
                observed[keyPath: storageKeyPath].stored = newValue
                observed.setNeedsLayout()
            }
        }
    }
    
    public var wrappedValue: Value {
        get { fatalError("called wrappedValue getter") }
        set { fatalError("called wrappedValue setter") }
    }
    
    public init(wrappedValue: Value) {
        self.stored = wrappedValue
    }
}
