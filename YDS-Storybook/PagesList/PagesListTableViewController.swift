//
//  PagesListTableViewController.swift
//  YDS-Storybook
//
//  Created by Gyuni on 2021/10/09.
//

import UIKit

final class PagesListTableViewController: UITableViewController {

    //  MARK: - ViewModel
    private let viewModel: PagesListViewModel
    
    //  MARK: - Init
    init(with viewModel: PagesListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //  MARK: - Func
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.reuseIdentifier)
            }

}

//  MARK: - Data Source
extension PagesListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSectionsInTableView
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.tableView(titleForHeaderInSection: section)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableView(numberOfRowsInSection: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseIdentifier,
                                                                  for: indexPath)
        
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = viewModel.tableView(titleForRowAt: indexPath)
        return cell
    }
}

//  MARK: - Delegate
extension PagesListTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.itemDidTap(at: indexPath)
    }
}
