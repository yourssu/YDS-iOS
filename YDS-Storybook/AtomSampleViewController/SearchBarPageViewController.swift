//
//  SearchBarPageViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/08/23.
//

import UIKit
import YDS
import SnapKit

class SearchBarPageViewController: StoryBookViewController {

    let sampleSearchBar: YDSSearchBar = {
        let searchBar = YDSSearchBar()
        return searchBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addOptions()
        self.extendedLayoutIncludesOpaqueBars = true
        self.navigationItem.titleView = sampleSearchBar
    }

    private func setupView() {
        setViewProperty()
    }

    private func setViewProperty() {
        self.title = "SearchBar"
    }

    private func addOptions() {
        addOption(description: "placeholder",
                  defaultValue: "검색어를 입력해주세요.") { [weak self] value in
            self?.sampleSearchBar.placeholder = value
        }

        addOption(description: "isDisabled",
                  defaultValue: false) { [weak self] value in
            self?.sampleSearchBar.isDisabled = value
        }
    }

}

extension SearchBarPageViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sampleSearchBar.endEditing(true)
    }
}
