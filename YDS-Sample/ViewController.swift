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
    let divider: YDSDivider = {
        let divider = YDSDivider(.horizontal)
        divider.thickness = .thick
        return divider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    private func setUI(){
        self.view.addSubview(divider)
        divider.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
}
