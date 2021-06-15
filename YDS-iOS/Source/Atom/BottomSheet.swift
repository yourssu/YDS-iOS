//
//  BottomSheet.swift
//  YDS-iOS
//
//  Created by 김윤서 on 2021/06/11.
//

import PanModal
import UIKit
import SnapKit

public class BottomSheet: UIViewController{
    private let vStack: UIStackView = {
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.spacing = 0
        vStack.alignment = .fill
        return vStack
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setScrollView()
    }
    
    public func addViews(views : [UIView]){
        views.forEach {
            vStack.addArrangedSubview($0)
        }
    }
    
    private func setScrollView(){
        
        let contentView = UIView()
        
        if let scrollView = panScrollable{
            view.addSubview(scrollView)

            scrollView.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
            
            scrollView.addSubview(contentView)
            
            contentView.snp.makeConstraints { (make) in
                make.edges.equalTo(0)
                make.width.equalTo(Screen.width)
                make.height.equalTo(Screen.height)
            }
                    
            contentView.addSubview(vStack)
            
            vStack.snp.makeConstraints {
                $0.top.equalTo(contentView.snp.top).offset(20)
                $0.centerX.equalTo(contentView)
            }
        }
    }
}

extension BottomSheet : PanModalPresentable{
    public var panScrollable: UIScrollView? {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = YDSColor.bgNormal
        scrollView.isScrollEnabled = false
        return scrollView
    }
    
    public var transitionDuration: Double{
        return Animation.Duration.m
    }
    
    public var transitionAnimationOptions: UIView.AnimationOptions{
        return Animation.Options.curveEaseInOut
    }
    
    public var allowsDragToDismiss: Bool{
        return true
    }
    
    public var showDragIndicator: Bool{
        return false
    }
    
    public var cornerRadius: CGFloat{
        return Constant.Rounding.r8
    }
    
    public var panModalBackgroundColor: UIColor{
        return YDSColor.dimNormal
    }

    public var longFormHeight: PanModalHeight {
        let stackHeight = vStack.frame.height
        vStack.layoutIfNeeded()
        
        let minHeight : CGFloat = 88.0
        var contentHeight : CGFloat = 0.0
        
        if stackHeight + 40 < minHeight{
            contentHeight = minHeight
        }
        else if stackHeight > Screen.height - 88{
            contentHeight =   Screen.height - 88
            panScrollable?.isScrollEnabled = true
        }
        else{
            contentHeight = stackHeight+40
        }
        
        return .contentHeight(contentHeight)
    }
}
