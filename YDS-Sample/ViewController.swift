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
    
    let icon: YDSIconImage = {
        let icon = YDSIconImage(icon: YDSIcon.adbadgeLine)
        icon.image = YDSIcon.adbadgeLine
        icon.tintColor = YDSColor.textPointed
        icon.size = .medium
        return icon
    }()

    let boxButton: BoxButton = {
        let boxButton = BoxButton()
        boxButton.type = .filled
        boxButton.size = .extraLarge
        boxButton.rounding = .r8
        boxButton.leftIcon = YDSIcon.adbadgeLine
        boxButton.statee = .enabled
        boxButton.setTitle("테스트", for: .normal)
        return boxButton
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
        self.view.addSubview(icon)
        icon.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
        
        /*
        boxButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-40)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-32)
        }
 */
     }
}

public class BoxButton: UIButton {
    
    
    public override var isHighlighted: Bool{
        didSet {
            print(isHighlighted)
            if isHighlighted {
                self.tintColor = .red
            } else {
                self.tintColor = .blue
            }
        }
    }

    public override var isSelected: Bool {
        didSet {
            print(isSelected)
        }
    }
    
    public enum BoxButtonType {
        case filled
        case tinted
        case line
    }
    
    public enum BoxButtonState {
        case enabled
        case disabled
        case warned
    }
    
    public enum BoxButtonSize {
        case full
        case extraLarge
        case large
        case medium
        case small
    }
    
    public enum BoxButtonRounding: Int {
        case r8 = 8
        case r4 = 4
        case r0 = 0
    }
    
    public var type: BoxButtonType = .filled {
        didSet { setBoxButtonTypeAndState() }
    }
    
    public var statee: BoxButtonState = .enabled {
        didSet { setBoxButtonTypeAndState() }
    }
    
    public var size: BoxButtonSize = .extraLarge {
        didSet { setBoxButtonSize() }
    }
    
    public var rounding: BoxButtonRounding = .r8 {
        didSet { setBoxButtonRounding() }
    }
    
    public var leftIcon: UIImage? = nil {
        didSet { setLeftIcon() }
    }
    
    public var rightIcon: UIImage? = nil {
        didSet { setRightIcon() }
    }
    
    public init() {
        super.init(frame: CGRect.zero)
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setBoxButtonTypeAndState() {
        switch type {
        case .filled:
            switch statee {
            case .enabled:
                self.backgroundColor = YDSColor.buttonPoint
                self.setBackgroundColor(UIColor(red: 78/256, green: 178/256, blue: 254/256, alpha: 1), for: .highlighted)
                self.tintColor = .red
                // self.setTitleColor(YDSColor.buttonReversed, for: .normal)
            case .disabled:
                self.backgroundColor = YDSColor.buttonDisabledBG
                self.tintColor = .red
            case .warned:
                self.backgroundColor = YDSColor.buttonWarned
                self.tintColor = .red
                // self.setTitleColor(YDSColor.buttonReversed, for: .normal)
                // self.setTitleColor(self.titleColor(for: .normal)!.withAlphaComponent(0.7), for: .highlighted)
                
                self.setBackgroundColor(UIColor(red: 243/256, green: 116/256, blue: 118/256, alpha: 1), for: .highlighted)
            }
        case .tinted:
            switch statee {
            case .enabled:
                self.backgroundColor = YDSColor.buttonPointBG
                // self.setTitleColor(YDSColor.buttonPoint, for: .normal)
                // self.setTitleColor(self.titleColor(for: .normal)!.withAlphaComponent(0.7), for: .highlighted)
                
                self.setTitleColor(UIColor(red: 78/256, green: 178/256, blue: 254/256, alpha: 1), for: .highlighted)
            case .disabled:
                self.backgroundColor = YDSColor.buttonDisabledBG
                // self.setTitleColor(YDSColor.buttonDisabled, for: .normal)
            case .warned:
                self.backgroundColor = YDSColor.buttonWarnedBG
                // self.setTitleColor(YDSColor.buttonWarned, for: .normal)
                // self.setTitleColor(self.titleColor(for: .normal)!.withAlphaComponent(0.7), for: .highlighted)
            }
        case .line:
            switch statee {
            case .enabled:
                self.backgroundColor = .clear
                // self.setTitleColor(YDSColor.buttonPoint, for: .normal)
                // self.setTitleColor(self.titleColor(for: .normal)!.withAlphaComponent(0.7), for: .highlighted)
                self.layer.borderWidth = 1
                self.layer.borderColor = YDSColor.buttonPoint.cgColor
            case .disabled:
                self.backgroundColor = .clear
                // self.setTitleColor(YDSColor.buttonDisabled, for: .normal)
                self.layer.borderWidth = 1
                self.layer.borderColor = YDSColor.buttonDisabled.cgColor
            case .warned:
                self.backgroundColor = .clear
                // self.setTitleColor(YDSColor.buttonWarned, for: .normal)
                // self.setTitleColor(self.titleColor(for: .normal)!.withAlphaComponent(0.7), for: .highlighted)
                self.layer.borderColor = YDSColor.buttonWarned.cgColor
            }
        }
    }
    
    private func setBoxButtonSize() {
        switch size {
        case .full:
            self.snp.makeConstraints {
                $0.height.equalTo(56)
            }
            self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        case .extraLarge:
            self.snp.makeConstraints {
                $0.height.equalTo(56)
            }
            self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        case .large:
            self.snp.makeConstraints {
                $0.height.equalTo(48)
            }
            self.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        case .medium:
            self.snp.makeConstraints {
                $0.height.equalTo(40)
            }
            self.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        case .small:
            self.snp.makeConstraints {
                $0.height.equalTo(32)
            }
            self.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        }
    }
    
    private func setBoxButtonRounding() {
        switch rounding {
        case .r8:
            self.layer.cornerRadius = CGFloat(rounding.rawValue)
        case .r4:
            self.layer.cornerRadius = CGFloat(rounding.rawValue)
        case .r0:
            self.layer.cornerRadius = CGFloat(rounding.rawValue)
        }
    }
    
    private func setLeftIcon() {
        self.setImage(leftIcon?.withRenderingMode(.alwaysTemplate), for: .normal)
        self.semanticContentAttribute = .forceLeftToRight
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
        self.adjustsImageWhenHighlighted = false
    }
    
    private func setRightIcon() {
        self.setImage(rightIcon?.withRenderingMode(.alwaysTemplate), for: .normal)
        self.semanticContentAttribute = .forceRightToLeft
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        self.adjustsImageWhenHighlighted = false
    }
    
    private func setIconSize() {
        if self.size == BoxButtonSize.small {
            
        } else {
            
        }
    }
    
}

extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))
        
        let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
         
        self.setBackgroundImage(backgroundImage, for: state)
    }
}
