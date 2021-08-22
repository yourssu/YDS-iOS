//
//  PageListViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/19.
//

import UIKit
import YDS

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
        Page(title: "ProfileImageView", vc: ProfileImageViewPageViewController.self),
        Page(title: "Badge", vc: BadgePageViewController.self),
        Page(title: "BoxButton", vc: BoxButtonPageViewController.self),
        Page(title: "PlainButton", vc: PlainButtonPageViewController.self),
        Page(title: "Checkbox", vc: CheckboxPageViewController.self),
        Page(title: "SimpleTextField", vc: SimpleTextFieldSampleViewController.self),
        Page(title: "SuffixTextField", vc: SuffixTextFieldSampleViewController.self),
        Page(title: "PasswordTextField", vc: PasswordTextFieldSampleViewController.self),
        Page(title: "SearchTextField", vc: SearchTextFieldSampleViewController.self),
        Page(title: "SearchBar", vc: SearchBarSampleViewController.self),
    ]
    
    let componentPages: [Page] = [
        Page(title: "Toast", vc: ToastPageViewController.self),
        Page(title: "TopBar", vc: TopBarPageViewController.self),
        Page(title: "SingleTitleTopBar", vc: SingleTitleTopBarPageViewController.self),
        Page(title: "DoubleTitleTopBar", vc: DoubleTitleTopBarPageViewController.self),
        Page(title: "BottomBarController", vc: BottomBarControllerPageViewController.self),
    ]

    
    //  MARK: - PageListViewController Setting
    
    private let searchButton = YDSTopBarButton(image: YDSIcon.searchLine)
    private let bellButton = YDSTopBarButton(image: YDSIcon.bellLine)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = YDSColor.bgNormal
        
        pageListTableView.dataSource = self
        pageListTableView.register(PageListTableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        
        view.addSubview(pageListTableView)
        pageListTableView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
        
        self.navigationItem.setRightBarButtonItems(
            [UIBarButtonItem(customView: bellButton),
             UIBarButtonItem(customView: searchButton)],
            animated: true)
        
        [searchButton, bellButton].forEach {
            $0.addTarget(self, action: #selector(buttonTapAction(_:)), for: .touchUpInside)
        }
    }
    
    @objc
    private func buttonTapAction(_ sender: UIButton) {
        switch(sender) {
        case searchButton:
            YDSToast.makeToast(text: "Search button pressed", duration: .short)
        case bellButton:
            YDSToast.makeToast(text: "Bell button pressed", duration: .short)
        default:
            return
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
