//
//  TabBarPageViewController.swift
//  YDS-Storybook
//
//  Created by Yonghyun on 2022/06/05.
//

import UIKit
import SnapKit
import YDS
import Parchment

class TabBarPageViewController: StoryBookViewController {
    
    private struct TabBarModel {
        var type: PagingViewController.TabBarType = .scrollable
        var numberOfTaps: Int = 8
    }
    
    private var tabBarInfo: TabBarModel = TabBarModel()
    
    private let numberOfTapsArr: [Int] = Array(2...10)
    
    private let pushButton: YDSBoxButton = {
        let button = YDSBoxButton()
        button.size = .large
        button.rounding = .r8
        button.type = .filled
        button.text = "샘플 페이지 보기"
        return button
    }()
    
    private let spacer: UIView = {
        let view = UIView()
        view.snp.makeConstraints {
            $0.height.equalTo(60)
        }
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addOptions()
        setupView()
        registerTapAction()
    }

    private func setupView() {
        setLayouts()
    }

    private func setLayouts() {
        setViewHierarchy()
        setAutolayout()
    }

    private func setViewHierarchy() {
        self.view.addSubviews(pushButton)
        stackView.addArrangedSubview(spacer)
    }

    private func setAutolayout() {
        pushButton.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-32)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(16)
        }
    }

    private func addOptions() {
        addOption(description: "TabBarType",
                  cases: PagingViewController.TabBarType.allCases,
                  defaultIndex: 0) { [weak self] value in
            self?.tabBarInfo.type = value
        }

        addOption(description: "number of tabs",
                  cases: numberOfTapsArr,
                  defaultIndex: 2) { [weak self] value in
            self?.tabBarInfo.numberOfTaps = value
        }
    }
    
    private func registerTapAction() {
        pushButton.addTarget(self, action: #selector(buttonTapAction(_:)), for: .touchUpInside)
    }

    @objc
    private func buttonTapAction(_ sender: UIButton) {
        switch(sender) {
        case pushButton:
            var viewControllers: [UIViewController] = []
            
            for i in 0..<tabBarInfo.numberOfTaps {
                viewControllers.append(ContentViewController(index: i))
            }
            
            let sampleViewController: YDSTabBarViewController = YDSTabBarViewController(type: tabBarInfo.type,
                                                                                        viewControllers: viewControllers)
            self.navigationController?.pushViewController(sampleViewController, animated: true)
        default:
            return
        }
    }
}

extension PagingViewController.TabBarType: CaseIterable {
    public static var allCases: [PagingViewController.TabBarType] = [.scrollable, .fixed]
}
