//
//  TypographiesTableViewController.swift
//  YDS-Storybook
//
//  Created by Gyuni on 2021/09/14.
//

import UIKit

class TypographiesTableViewController: UITableViewController {
    
    private var model: [[String]]
    
    init(with model: [[String]]) {
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
        self.tableView.register(TypographiesListItemCell.self, forCellReuseIdentifier: TypographiesListItemCell.reuseIdentifier)
        self.tableView.separatorStyle = .none
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model[section][0]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TypographiesListItemCell = tableView.dequeueReusableCell(for: indexPath)

        return cell
    }
    
}
