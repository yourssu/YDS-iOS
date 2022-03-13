//
//  IconsListTableViewController.swift
//  YDS-Storybook
//
//  Created by Yonghyun on 2022/03/13.
//

import UIKit
import YDS

class IconsListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        setViewProperties()
    }
    
    private func setViewProperties() {
        self.tableView.register(IconsListItemCell.self, forCellReuseIdentifier: IconsListItemCell.reuseIdentifier)
        self.tableView.separatorStyle = .none
    }

}

//  MARK: - DataSource
extension IconsListTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ydsIconArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: IconsListItemCell = tableView.dequeueReusableCell(for: indexPath)
        cell.fillData(with: ydsIconArray[indexPath.row])
        return cell
    }
}
