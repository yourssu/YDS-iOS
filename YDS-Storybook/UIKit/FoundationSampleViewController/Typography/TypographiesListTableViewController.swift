//
//  TypographiesListTableViewController.swift
//  YDS-Storybook
//
//  Created by Gyuni on 2021/09/14.
//

import UIKit
import YDS

class TypographiesListTableViewController: UITableViewController {

    private var model: [Typographies]

    init(with model: [Typographies]) {
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
        self.tableView.register(TypographiesListItemCell.self,
                                forCellReuseIdentifier: TypographiesListItemCell.reuseIdentifier)
        self.tableView.separatorColor = YDSColor.borderNormal
    }

    // MARK: - DataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model[section].description
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model[section].items.count
    }
   
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TypographiesListItemCell = tableView.dequeueReusableCell(for: indexPath)
        cell.fillData(with: model[indexPath.section].items[indexPath.row])
        return cell
    }

}
