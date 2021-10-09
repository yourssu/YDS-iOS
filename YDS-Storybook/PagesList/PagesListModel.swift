//
//  PagesListModel.swift
//  YDS-Storybook
//
//  Created by Gyuni on 2021/10/09.
//

import UIKit

struct PagesListModel {
    let pagesSectionsList: [PagesSection]
    
    init(pagesSectionsList: [PagesSection] = [
        foundationPagesSection,
        atomPagesSection,
        componentPagesSection,
    ]) {
        self.pagesSectionsList = pagesSectionsList
    }
}

struct PagesSection {
    let title: String
    let pages: [Page]
}

struct Page {
    let title: String
    let vc: UIViewController.Type
}

//  MARK: - 여기 아래에 각 단계에 맞는 Page를 추가해주세요.
fileprivate let foundationPagesSection = PagesSection(
    title: "1. Foundation",
    pages: [
        Page(title: "Color", vc: ColorsPageViewController.self),
        Page(title: "Typography", vc: TypographiesPageViewController.self),
    ]
)

fileprivate let atomPagesSection = PagesSection(
    title: "2. Atom",
    pages: [
        Page(title: "ProfileImageView", vc: ProfileImageViewPageViewController.self),
        Page(title: "Badge", vc: BadgePageViewController.self),
        Page(title: "BoxButton", vc: BoxButtonPageViewController.self),
        Page(title: "PlainButton", vc: PlainButtonPageViewController.self),
        Page(title: "Checkbox", vc: CheckboxPageViewController.self),
        Page(title: "SimpleTextFieldView", vc: SimpleTextFieldViewPageViewController.self),
        Page(title: "SuffixTextFieldView", vc: SuffixTextFieldViewPageViewController.self),
        Page(title: "PasswordTextFieldView", vc: PasswordTextFieldViewPageViewController.self),
        Page(title: "SearchTextField", vc: SearchTextFieldPageViewController.self),
        Page(title: "SearchBar", vc: SearchBarPageViewController.self),
    ]
)

fileprivate let componentPagesSection = PagesSection(
    title: "3. Component",
    pages: [
        Page(title: "Toast", vc: ToastPageViewController.self),
        Page(title: "TopBar", vc: TopBarPageViewController.self),
        Page(title: "SingleTitleTopBar", vc: SingleTitleTopBarPageViewController.self),
        Page(title: "DoubleTitleTopBar", vc: DoubleTitleTopBarPageViewController.self),
        Page(title: "BottomBarController", vc: BottomBarControllerPageViewController.self),
    ]
)
