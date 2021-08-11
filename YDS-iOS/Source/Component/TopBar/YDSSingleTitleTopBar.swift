//
//  YDSSingleTitleTopBar.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/08/09.
//

import UIKit

public class YDSSingleTitleTopBar: YDSTopBar {

    public var title: String? {
        get {
            return self.titleLabel.text
        }
        set(inputValue) {
            self.titleLabel.text = inputValue
        }
    }
        
    private let titleLabel: YDSLabel = {
        let label = YDSLabel(style: .title2)
        label.textColor = YDSColor.textPrimary
        return label
    }()
    
    public init(title: String?) {
        super.init()
        self.title = title
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setProperties()
        setLayouts()
    }
    
    private func setProperties() {
        self.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.clear,
        ]
    }
    
    private func setLayouts() {
        setViewHierarchy()
    }
    
    private func setViewHierarchy() {
        self.topItem?.setLeftBarButton(UIBarButtonItem(customView: titleLabel), animated: true)
    }
        
}
