//
//  TooltipSampleViewController.swift
//  YDS-Storybook
//
//  Created by Yonghyun on 2022/04/03.
//

import UIKit
import YDS
import SnapKit

class TooltipSampleViewController: UIViewController {
    
    let tooltip: YDSTooltip = {
        let tooltip = YDSTooltip(text: "",
                                 color: .tooltipPoint,
                                 tailPosition: .bottomRight,
                                 duration: .short)
        return tooltip
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tooltip.show()
    }
    
    private func setupView() {
        setProperties()
        setLayouts()
    }
    
    private func setProperties() {
        self.view.backgroundColor = YDSColor.bgNormal
    }
    
    private func setLayouts() {
        setViewHierarchy()
        setAutolayout()
    }
    
    private func setViewHierarchy() {
        self.view.addSubview(tooltip)
    }
    
    private func setAutolayout() {
        tooltip.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
