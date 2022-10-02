//
//  YDSBottomSheet.swift
//  YDS-iOS
//
//  Created by 김윤서 on 2021/06/11.
//

import PanModal
import UIKit
import SnapKit

public class YDSBottomSheet: UIViewController {
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

    public func addViews(views: [UIView]) {
        views.forEach {
            vStack.addArrangedSubview($0)
        }
    }

    private func setScrollView() {

        let contentView = UIView()

        if let scrollView = panScrollable {
            view.addSubview(scrollView)

            scrollView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }

            scrollView.addSubview(contentView)

            contentView.snp.makeConstraints {
                $0.edges.equalTo(0)
                $0.width.equalTo(YDSScreenSize.width)
                $0.height.equalTo(YDSScreenSize.height)
            }

            contentView.addSubview(vStack)

            vStack.snp.makeConstraints {
                $0.top.equalTo(contentView.snp.top).offset(20)
                $0.centerX.equalTo(contentView)
            }
        }
    }
}

extension YDSBottomSheet: PanModalPresentable {
    public var panScrollable: UIScrollView? {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = YDSColor.bgNormal
        scrollView.isScrollEnabled = false
        return scrollView
    }

    public var transitionDuration: Double {
        return YDSAnimation.Duration.medium
    }

    public var transitionAnimationOptions: UIView.AnimationOptions {
        return YDSAnimation.Options.curveEaseInOut
    }

    public var allowsDragToDismiss: Bool {
        return true
    }

    public var showDragIndicator: Bool {
        return false
    }

    public var cornerRadius: CGFloat {
        return YDSConstant.Rounding.r8
    }

    public var panModalBackgroundColor: UIColor {
        return YDSColor.dimNormal
    }

    public var longFormHeight: PanModalHeight {
        let stackHeight = vStack.frame.height
        vStack.layoutIfNeeded()

        var contentHeight: CGFloat = 0.0
        let padding: CGFloat = 40.0

        if stackHeight + padding < BottomSheetHeight.min {
            contentHeight = BottomSheetHeight.min
        } else if stackHeight > BottomSheetHeight.max {
            contentHeight = BottomSheetHeight.max
            panScrollable?.isScrollEnabled = true
        } else {
            contentHeight = stackHeight + padding
        }

        return .contentHeight(contentHeight)
    }
}

private enum BottomSheetHeight {
    static let min: CGFloat = 88.0
    static let max: CGFloat = YDSScreenSize.height - 88.0
}
