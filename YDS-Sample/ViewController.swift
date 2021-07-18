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
    let icon: YDSIconView = {
        let icon = YDSIconView()
        icon.image = YDSIcon.adbadgeFilled
        icon.tintColor = YDSColor.textPointed
        icon.size = .extraSmall
        return icon
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }


    private func setUI(){
        
    }
}
