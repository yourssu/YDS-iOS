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
    private let button : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .blue
        return btn
    }()
    
    let label : UILabel = {
        let label = UILabel()
        label.text = "안녕"
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    let label2 : UILabel = {
        let label = UILabel()
        label.text = "안녕"
        label.font = .systemFont(ofSize: 100)
        return label
    }()
    let label3 : UILabel = {
        let label = UILabel()
        label.text = "안녕"
        label.font = .systemFont(ofSize: 100)
        return label
    }()
    let label4 : UILabel = {
        let label = UILabel()
        label.text = "안녕"
        label.font = .systemFont(ofSize: 100)
        return label
    }()
    let label5 : UILabel = {
        let label = UILabel()
        label.text = "안녕"
        label.font = .systemFont(ofSize: 100)
        return label
    }()
    let label6 : UILabel = {
        let label = UILabel()
        label.text = "안녕"
        label.font = .systemFont(ofSize: 100)
        return label
    }()
    
    let label7 : UILabel = {
        let label = UILabel()
        label.text = "안녕"
        label.font = .systemFont(ofSize: 100)
        return label
    }()
    
    let label8 : UILabel = {
        let label = UILabel()
        label.text = "안녕"
        label.font = .systemFont(ofSize: 100)
        return label
    }()
    
    let label9 : UILabel = {
        let label = UILabel()
        label.text = "안녕"
        return label
    }()
    
    let divider: YDSDivider = {
        let divider = YDSDivider()
        divider.direction = .horizontal
        divider.thickness = .thin
        return divider
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    @objc
    private func onModalBtnClicked(_ sender: UIButton) {
        let vc = BottomSheet()
        vc.addViews(views: [label,label2,label3,label4,label5,label6,label7])
        presentPanModal(vc)
    }

    private func setUI(){
        view.addSubview(button)
        view.addSubview(divider)

        divider.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.centerX.centerY.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.width.equalTo(50)
        }
        
        button.addTarget(self, action: #selector(onModalBtnClicked(_:)), for: .touchUpInside)
    }
}

