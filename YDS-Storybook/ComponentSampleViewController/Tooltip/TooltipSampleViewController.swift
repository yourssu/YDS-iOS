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
    
    private let tooltip: YDSTooltip
    
    init(text: String,
         color: YDSTooltip.TooltipColor,
         tailPosition: YDSTooltip.TailPosition,
         duration: YDSTooltip.TooltipDuration) {
        tooltip = YDSTooltip(text: text,
                             color: color,
                             tailPosition: tailPosition,
                             duration: duration)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
