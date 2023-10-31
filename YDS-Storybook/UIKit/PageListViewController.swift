//
//  PageListViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/19.
//

// swiftlint:disable identifier_name

import UIKit
import YDS

class PageListViewController: UIViewController {

    let pageListTableView: UITableView = UITableView()
    let cellIdentifier: String = "cell"

    // MARK: - tableView에 들어갈 섹션과 셀에 대한 코드입니다.

    //  각 섹션의 타이틀로 사용될 문자열입니다.
    let sections: [String] = ["1. Foundation", "2. Atom", "3. Component"]

    //  title은 cell에 표시되는 글자입니다.
    //  vc는 cell을 터치했을 때 나타날 ViewController입니다.
    struct Page {
        let title: String
        let vc: UIViewController.Type
    }

    //  여기 아래에 각 단계에 맞는 Page를 추가해주세요.

    let foundationPages: [Page] = [
        Page(title: "Color", vc: ColorsPageViewController.self),
        Page(title: "Typography", vc: TypographiesPageViewController.self),
        Page(title: "Icon", vc: IconsPageViewController.self)
    ]

    let atomPages: [Page] = [
        Page(title: "Label", vc: LabelPageViewController.self),
        Page(title: "ProfileImageView", vc: ProfileImageViewPageViewController.self),
        Page(title: "Badge", vc: BadgePageViewController.self),
        Page(title: "BoxButton", vc: BoxButtonPageViewController.self),
        Page(title: "PlainButton", vc: PlainButtonPageViewController.self),
        Page(title: "EmojiButton", vc: EmojiButtonPageViewController.self),
        Page(title: "Checkbox", vc: CheckboxPageViewController.self),
        Page(title: "SimpleTextFieldView", vc: SimpleTextFieldViewPageViewController.self),
        Page(title: "SuffixTextFieldView", vc: SuffixTextFieldViewPageViewController.self),
        Page(title: "PasswordTextFieldView", vc: PasswordTextFieldViewPageViewController.self),
        Page(title: "SearchTextField", vc: SearchTextFieldPageViewController.self),
        Page(title: "SearchBar", vc: SearchBarPageViewController.self),
        Page(title: "BottomSheet", vc: BottomSheetPageViewController.self),
        Page(title: "TextView", vc: TextViewViewController.self),
        Page(title: "ChipView", vc: ChipPageViewController.self)
    ]

    let componentPages: [Page] = [
        Page(title: "Toast", vc: ToastPageViewController.self),
        Page(title: "TopBar", vc: TopBarPageViewController.self),
        Page(title: "SingleTitleTopBar", vc: SingleTitleTopBarPageViewController.self),
        Page(title: "DoubleTitleTopBar", vc: DoubleTitleTopBarPageViewController.self),
        Page(title: "BottomBarController", vc: BottomBarControllerPageViewController.self),
        Page(title: "Tooltip", vc: TooltipPageViewController.self),
        Page(title: "TabBar", vc: TabBarPageViewController.self),
        Page(title: "List", vc: ListPageViewController.self)
    ]

    // MARK: - PageListViewController Setting

    private let versionCheckButton = YDSTopBarButton(image: YDSIcon.warningcircleLine)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    private func setupView() {
        view.backgroundColor = YDSColor.bgNormal
        self.extendedLayoutIncludesOpaqueBars = true

        pageListTableView.dataSource = self
        pageListTableView.register(PageListTableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)

        view.addSubview(pageListTableView)
        pageListTableView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }

        if let titleLabel = self.navigationItem.leftBarButtonItem?.customView as? UILabel {
            titleLabel.font = UIFont(name: "Avenir-Black", size: 22)
        }

        self.navigationItem.setRightBarButtonItems(
            [UIBarButtonItem(customView: versionCheckButton)],
            animated: true)

        [versionCheckButton].forEach {
            $0.addTarget(self, action: #selector(buttonTapAction(_:)), for: .touchUpInside)
        }
    }

    @objc
    private func buttonTapAction(_ sender: UIButton) {
        switch sender {
        case versionCheckButton:
            if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
                YDSToast.makeToast(text: "Current Version : \(version)", duration: .short)
            }
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
        switch section {
        case 0:
            return foundationPages.count
        case 1:
            return atomPages.count
        case 2:
            return componentPages.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let page: Page

        switch indexPath.section {
        case 0:
            page = foundationPages[indexPath.row]
        case 1:
            page = atomPages[indexPath.row]
        case 2:
            page = componentPages[indexPath.row]
        default:
            page = Page(title: "error", vc: UIViewController.self)
        }

        let cell = pageListTableView.dequeueReusableCell(withIdentifier: self.cellIdentifier,
                                                         for: indexPath) as? PageListTableViewCell
        cell?.textLabel?.text = page.title
        cell?.vc = page.vc
        cell?.parent = self
        return cell ?? UITableViewCell()
    }
}
