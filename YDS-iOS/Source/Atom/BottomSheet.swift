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
    let vStack: UIStackView = {
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.spacing = 0
        vStack.alignment = .fill
        return vStack
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(vStack)

        vStack.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
        }
    }
    
    public func addView(items : [UIView]){
        items.forEach {
            vStack.addArrangedSubview($0)
        }
    }
}

extension BottomSheet : PanModalPresentable{
    
    public var panScrollable: UIScrollView? {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+300)
        scrollView.isScrollEnabled = true
        return scrollView
    }
    
    public var allowsDragToDismiss: Bool{
        return true
    }
    
    public var showDragIndicator: Bool{
        return false
    }
    
    public var cornerRadius: CGFloat{
        return 8
    }
    
    public var shortFormHeight: PanModalHeight {
        return .contentHeight(300)
    }

    public var longFormHeight: PanModalHeight {
        let stackHeight = vStack.frame.height
        vStack.layoutIfNeeded()
        print(stackHeight)
        return .contentHeight(stackHeight+40)
    }
    
//    public var anchorModalToLongForm: Bool {
//        return false
//    }
    
    public var allowsExtendedPanScrolling: Bool{
        return false
    }

}

