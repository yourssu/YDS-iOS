//
//  SetNeeds.swift
//  YDS
//
//  Created by Yonghyun on 2022/07/17.
//

// swiftlint:disable unused_setter_value

import UIKit

@available(iOS, introduced: 13, deprecated: 15, message: "iOS 15 이상의 버전에서는 @Invalidating property wrapper를 사용해주세요")
public struct SetNeedsOptions: OptionSet {
    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public static let display = SetNeedsOptions(rawValue: 1 << 0)
    public static let layout = SetNeedsOptions(rawValue: 1 << 1)
}

@available(iOS, introduced: 13, deprecated: 15, message: "iOS 15 이상의 버전에서는 @Invalidating property wrapper를 사용해주세요")
@propertyWrapper
public struct SetNeeds<Value: Equatable> {
    private var value: Value
    private let setNeedsOptions: SetNeedsOptions

    public init(wrappedValue: Value, _ setNeedsOptions: SetNeedsOptions) {
        self.value = wrappedValue
        self.setNeedsOptions = setNeedsOptions
    }

    public init(wrappedValue: Value, _ setNeedsOptions: SetNeedsOptions...) {
        self.value = wrappedValue
        self.setNeedsOptions = setNeedsOptions.reduce(into: []) { $0.insert($1) }
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

            let setNeedsOptions = observed[keyPath: storageKeyPath].setNeedsOptions

            if setNeedsOptions.contains(.display) {
                observed.setNeedsDisplay()
            }

            if setNeedsOptions.contains(.layout) {
                observed.setNeedsLayout()
            }
        }
    }
}
