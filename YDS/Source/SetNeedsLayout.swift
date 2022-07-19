//
//  SetNeedsLayout.swift
//  YDS
//
//  Created by Yonghyun on 2022/07/17.
//

import UIKit

@available(iOS, introduced: 13, deprecated: 15, message: "iOS 15 이상의 버전에서는 @Invalidating property wrapper를 사용해주세요")
<<<<<<< c6312b22973ecc8c52b2fa54dd8442d02cce3346
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

=======
>>>>>>> [#128] -1 @SetNeedsLayout 수정
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
