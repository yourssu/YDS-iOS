//
//  TypographiesPageViewController.swift
//  YDS-Storybook
//
//  Created by Gyuni on 2021/09/14.
//

import UIKit

class TypographiesPageViewController: UIViewController {

    private let typographiesListTableViewController: TypographiesListTableViewController

    init() {
        typographiesListTableViewController = TypographiesListTableViewController(with: typographies)

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
        self.title = "Typography"
    }

    private func setViewHierarchy() {
        self.embed(typographiesListTableViewController)
        self.view.addSubview(typographiesListTableViewController.view)
    }

    private func setAutolayout() {
        typographiesListTableViewController.view.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }

}
