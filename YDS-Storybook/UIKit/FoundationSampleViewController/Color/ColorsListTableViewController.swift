//
//  ColorsListTableViewController.swift
//  YDS-Storybook
//
//  Created by Gyuni on 2021/09/10.
//

import UIKit
import YDS

class ColorsListTableViewController: UITableViewController {

    private var model: [WrappedUIKitColors]

    init(with model: [WrappedUIKitColors]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    private func setupViews() {
        setViewProperties()
    }

    private func setViewProperties() {
        self.tableView.register(ColorsListItemCell.self, forCellReuseIdentifier: ColorsListItemCell.reuseIdentifier)
        self.tableView.separatorStyle = .none
    }

}

// MARK: - DataSource
extension ColorsListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model[section].description
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model[section].items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ColorsListItemCell = tableView.dequeueReusableCell(for: indexPath)
        cell.fillData(with: model[indexPath.section].items[indexPath.row])
        return cell
    }
}
