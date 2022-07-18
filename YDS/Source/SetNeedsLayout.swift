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
