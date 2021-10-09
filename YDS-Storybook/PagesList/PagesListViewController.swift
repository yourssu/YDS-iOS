//
//  PageListViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/19.
//

import RxSwift
import UIKit
import YDS

class PagesListViewController: UIViewController {
    
    //  MARK: - ViewModel
    private let viewModel = PagesListViewModel()
    private let bag = DisposeBag()
    
    //  MARK: - ViewController
    private let pagesListTableViewController: PagesListTableViewController
    
    //  MARK: - View
    private let versionButton = YDSTopBarButton(image: YDSIcon.checkLine)
    
    //  MARK: - Init
    init() {
        pagesListTableViewController = PagesListTableViewController(with: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //  MARK: - Func
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        bindViewModel()
    }
    
    private func setupView() {
        setViewProperties()
        setViewHierarchy()
        setAutolayout()
    }
    
    private func setViewProperties() {
        view.backgroundColor = YDSColor.bgNormal
        extendedLayoutIncludesOpaqueBars = true
        
        if let titleLabel = self.navigationItem.leftBarButtonItem?.customView as? UILabel {
            titleLabel.font = UIFont(name: "Avenir-Black", size: 22)
        }
        
        versionButton.addTarget(self,
                     action: #selector(buttonDidTap(_:)),
                     for: .touchUpInside)
    }
    
    private func setViewHierarchy() {
        self.navigationItem.setRightBarButtonItems(
            [UIBarButtonItem(customView: versionButton),],
            animated: true)
        
        embed(pagesListTableViewController)
        view.addSubview(pagesListTableViewController.tableView)
    }
    
    private func setAutolayout() {
        pagesListTableViewController.tableView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func bindViewModel() {
        viewModel.pushViewController
            .subscribe(onNext: { [weak self] viewController in
                self?
                    .navigationController?
                    .pushViewController(viewController, animated: true)
            } )
            .disposed(by: bag)
        
        viewModel.makeToast
            .subscribe(onNext: {
                YDSToast.makeToast(text: $0)
            })
            .disposed(by: bag)
    }
    
}

//  MARK: - Actions
extension PagesListViewController {
    @objc
    private func buttonDidTap(_ sender: UIButton) {
        switch(sender) {
        case versionButton:
            viewModel.versionButtonDidTap()
        default:
            return
        }
    }
}
