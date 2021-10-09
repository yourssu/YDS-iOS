//
//  PagesListViewModel.swift
//  YDS-Storybook
//
//  Created by Gyuni on 2021/10/09.
//

import UIKit
import RxSwift

final class PagesListViewModel {
    
    //  MARK: - Model
    private let model: PagesListModel
    
    //  MARK: - Input
    func itemDidTap(at indexPath: IndexPath) {
        let viewController = model
            .pagesSectionsList[indexPath.section]
            .pages[indexPath.row]
            .vc
            .init()
        
        pushViewController.onNext(viewController)
    }
    
    func versionButtonDidTap() {
        let version = Bundle
            .main
            .infoDictionary?["CFBundleShortVersionString"]
            as? String
        
        if let version = version {
            makeToast.onNext("Current Version: \(version)")
        }
    }
    
    //  MARK: - Output
    
    let pushViewController = PublishSubject<UIViewController>()
    
    let makeToast = PublishSubject<String>()
    
    var numberOfSectionsInTableView: Int {
        return model.pagesSectionsList.count
    }
    
    func tableView(titleForHeaderInSection section: Int) -> String? {
        return model.pagesSectionsList[section].title
    }
    
    func tableView(numberOfRowsInSection section: Int) -> Int {
        return model.pagesSectionsList[section].pages.count
    }
    
    func tableView(titleForRowAt indexPath: IndexPath) -> String {
        return model
            .pagesSectionsList[indexPath.section]
            .pages[indexPath.row]
            .title
    }
    
    //  MARK: - Init
    init(with model: PagesListModel = PagesListModel()) {
        self.model = model
    }
    
}
