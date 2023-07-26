//
//  ContentViewController.swift
//  YDS-Storybook
//
//  Created by Yonghyun on 2022/06/05.
//

import UIKit
import SnapKit
import YDS

final class ContentViewController: UIViewController {
    convenience init(index: Int) {
        self.init(title: "View \(index)", content: "\(index)")
    }

    convenience init(title: String) {
        self.init(title: title, content: title)
    }

    init(title: String, content: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = title

        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 50, weight: UIFont.Weight.thin)
        label.textColor = YDSColor.bottomBarSelected
        label.textAlignment = .center
        label.text = content
        label.sizeToFit()

        view.addSubview(label)
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        view.backgroundColor = .systemBackground
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
