//
//  ColorsPageViewController.swift
//  YDS-Storybook
//
//  Created by Gyuni on 2021/09/10.
//

import UIKit
import YDS
import SnapKit

class ColorsPageViewController: UIViewController {

    private let tableViewArea = UIView()
    private let colorsListTableViewController: ColorsListTableViewController

    init() {
        colorsListTableViewController = ColorsListTableViewController(with: wrappedUIKitColors)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    private func setupView() {
        setViewProperties()
        setViewHierarchy()
        setAutolayout()
    }

    private func setViewProperties() {
        self.title = "Color"
    }

    private func setViewHierarchy() {
        self.embed(colorsListTableViewController)
        self.view.addSubview(colorsListTableViewController.view)
    }

    private func setAutolayout() {
        colorsListTableViewController.view.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }

}
