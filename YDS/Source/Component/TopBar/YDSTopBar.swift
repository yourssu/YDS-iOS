//
//  YDSTopBar.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/08/11.
//

import UIKit

/**
 YDS 스타일의 TopBar입니다.
 NavigaionController의 TopBar를 사용할 수 없을 때
 YDSTopBar를 단독으로 사용할 수 있습니다.
 기본 TopBar에서 배경색, 투명도, 글씨 폰트, 컬러, 버튼 간격 등이 커스텀 되었습니다.
 */
public class YDSTopBar: UINavigationBar {

    // MARK: - 메소드

    /**
     YDS 스타일의 TopBar(=NavigationBar)를 생성합니다.
     */
    public init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /**
     뷰를 세팅합니다.
     */
    private func setupView() {
        setProperties()
    }

    /**
     각종 프로퍼티를 세팅합니다.
     */
    private func setProperties() {
        self.pushItem(UINavigationItem(), animated: true)
        self.barTintColor = YDSColor.bgElevated
        self.tintColor = YDSColor.buttonNormal
        self.isTranslucent = false
        self.shadowImage = UIImage()
        self.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: YDSColor.textPrimary,
            NSAttributedString.Key.font: YDSFont.subtitle2
        ]
    }

}

extension YDSTopBar {

    public override func layoutSubviews() {
        super.layoutSubviews()

        removeButtonBarSpacing()
        setButtonBarProperties()
    }

}
