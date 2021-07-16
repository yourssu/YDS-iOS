//
//  ViewController.swift
//  YDS-Sample
//
//  Created by 김윤서 on 2021/06/11.
//

import UIKit
import YDS_iOS
import SnapKit

class ViewController: UIViewController {
    let icon: YDSIconImage = {
        let icon = YDSIconImage()
        icon.image = YDSIcon.adbadgeFilled
        icon.tintColor = YDSColor.textPointed
        icon.size = .medium
        return icon
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    private func setUI(){
        self.view.addSubview(icon)
        icon.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
     }
}
