//
//  PageListViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/19.
//

import UIKit
import YDS_iOS

class PageListViewController: UIViewController {
    
    let pageListTableView: UITableView = UITableView()
    let cellIdentifier: String = "cell"
    
    //  MARK: - tableView에 들어갈 섹션과 셀에 대한 코드입니다.
    
    //  각 섹션의 타이틀로 사용될 문자열입니다.
    let sections: [String] = ["0. Rule", "1. Foundation", "2. Atom", "3. Component"]
    
    
    //  title은 cell에 표시되는 글자입니다.
    //  vc는 cell을 터치했을 때 나타날 ViewController입니다.
    struct Page {
        let title: String
        let vc: UIViewController.Type
    }
    
    
    //  여기 아래에 각 단계에 맞는 Page를 추가해주세요.
    let rulePages: [Page] = [
        Page(title: "Sample", vc: UIViewController.self),
    ]
    
    let foundationPages: [Page] = [
        Page(title: "Sample", vc: UIViewController.self),
    ]
    
    let atomPages: [Page] = [
        Page(title: "SimpleTextField", vc: SimpleTextFieldSampleViewController.self),
        Page(title: "SuffixTextField", vc: SuffixTextFieldSampleViewController.self),
        Page(title: "PasswordTextField", vc: PasswordTextFieldSampleViewController.self),
        Page(title: "SearchTextField", vc: SearchTextFieldSampleViewController.self),
        Page(title: "SearchBar", vc: SearchBarSampleViewController.self),
        Page(title: "BoxButton", vc: BoxButtonViewController.self),
    ]
    
    let componentPages: [Page] = [
        Page(title: "Sample", vc: UIViewController.self),
    ]

    
    //  MARK: - PageListViewController Setting
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = YDSColor.bgNormal
        self.title = "YDS Sample"
        
        self.navigationController?.navigationBar.tintColor = YDSColor.buttonNormal
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: YDSColor.textPrimary,
            NSAttributedString.Key.font: YDSFont.subtitle2,
        ]
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem()

        
        pageListTableView.dataSource = self
        pageListTableView.delegate = self
        pageListTableView.register(PageListTableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        
        view.addSubview(pageListTableView)
        pageListTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
 
    }

}

extension PageListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section) {
        case 0:
            return rulePages.count
        case 1:
            return foundationPages.count
        case 2:
            return atomPages.count
        case 3:
            return componentPages.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let page: Page
        
        switch(indexPath.section) {
        case 0:
            page = rulePages[indexPath.row]
        case 1:
            page = foundationPages[indexPath.row]
        case 2:
            page = atomPages[indexPath.row]
        case 3:
            page = componentPages[indexPath.row]
        default:
            page = Page(title: "error", vc: UIViewController.self)
        }
        
        let cell: PageListTableViewCell = pageListTableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! PageListTableViewCell
        cell.textLabel?.text = page.title
        cell.vc = page.vc
        cell.parent = self
        return cell
    }
}

extension PageListViewController: UITableViewDelegate {
    
}
