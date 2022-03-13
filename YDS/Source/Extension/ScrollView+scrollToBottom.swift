//
//  ScrollView+scrollToBottom.swift
//  YDS
//
//  Created by 강민석 on 2022/03/13.
//

import UIKit

public extension UIScrollView {
    func scrollToBottom(animated: Bool = true) {
        let bottomOffset = scrollBottomOffset()
        if bottomOffset.y > 0 {
            setContentOffset(bottomOffset, animated: animated)
        }
    }
    
    private func scrollBottomOffset() -> CGPoint {
        return CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)
    }
}
