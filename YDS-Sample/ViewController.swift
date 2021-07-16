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
    
    let title1Label: YDSLabel = {
        let label = YDSLabel(style: .title1)
        label.text = "title1 타이틀1"
        return label
    }()
    
    let title2Label: YDSLabel = {
        let label = YDSLabel(style: .title2)
        label.text = "title2 타이틀2"
        return label
    }()
    
    let title3Label: YDSLabel = {
        let label = YDSLabel(style: .title3)
        label.text = "title3 타이틀3"
        return label
    }()
    
    let subtitle1Label: YDSLabel = {
        let label = YDSLabel(style: .subtitle1)
        label.text = "subtitle1 서브타이틀1"
        return label
    }()
    
    let subtitle2Label: YDSLabel = {
        let label = YDSLabel(style: .subtitle2)
        label.text = "subtitle2 서브타이틀2"
        return label
    }()
    
    let subtitle3Label: YDSLabel = {
        let label = YDSLabel(style: .subtitle3)
        label.text = "subtitle3 서브타이틀3"
        return label
    }()
    
    let body1Label: YDSLabel = {
        let label = YDSLabel(style: .body1)
        label.text = "body1 바디1"
        return label
    }()
    
    let body2Label: YDSLabel = {
        let label = YDSLabel(style: .body2)
        label.text = "body2 바디2"
        return label
    }()
    
    let button0Label: YDSLabel = {
        let label = YDSLabel(style: .button0)
        label.text = "button0 버튼0"
        return label
    }()
    
    let button1Label: YDSLabel = {
        let label = YDSLabel(style: .button1)
        label.text = "button1 버튼1"
        return label
    }()
    
    let button2Label: YDSLabel = {
        let label = YDSLabel(style: .button2)
        label.text = "button2 버튼2"
        return label
    }()
    
    let button3Label: YDSLabel = {
        let label = YDSLabel(style: .button3)
        label.text = "button3 버튼3"
        return label
    }()
    
    let button4Label: YDSLabel = {
        let label = YDSLabel(style: .button4)
        label.text = "button4 버튼4"
        return label
    }()
    
    let caption1Label: YDSLabel = {
        let label = YDSLabel(style: .caption1)
        label.text = "caption1 캡션1"
        return label
    }()
    
    let caption2Label: YDSLabel = {
        let label = YDSLabel(style: .caption2)
        label.text = "caption2 캡션2"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    @objc
    private func onModalBtnClicked(_ sender: UIButton) {
        let vc = BottomSheet()
        vc.addViews(views: [
                        title1Label,
                        title2Label,
                        title3Label,
            
                        subtitle1Label,
                        subtitle2Label,
                        subtitle3Label,
            
                        body1Label,
                        body2Label,
            
                        button0Label,
                        button1Label,
                        button2Label,
                        button3Label,
                        button4Label,
            
                        caption1Label,
                        caption2Label
        ])
        presentPanModal(vc)
    }

    private func setUI(){
        view.addSubview(button)
        
        button.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.width.equalTo(50)
        }
        
        button.addTarget(self, action: #selector(onModalBtnClicked(_:)), for: .touchUpInside)
    }
}

