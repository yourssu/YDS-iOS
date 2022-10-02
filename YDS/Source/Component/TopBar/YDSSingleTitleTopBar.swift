//
//  YDSSingleTitleTopBar.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/08/09.
//

import UIKit

/**
 YDS 스타일의 TopBar입니다.
 굵은 Title 글씨가 들어간 TopBar가 필요하면서
 NavigaionController의 TopBar를 사용할 수 없을 때
 YDSSingleTitleTopBar를 단독으로 사용할 수 있습니다.
 기본 TopBar에서 배경색, 투명도, 글씨 폰트, 컬러, 버튼 간격 등이 커스텀 되었습니다.
 */
public class YDSSingleTitleTopBar: YDSTopBar {

    // MARK: - 외부에서 지정할 수 있는 속성

    /**
     NavigationBar 상단에 들어가는
     굵은 Title의 String입니다.
     */
    public var title: String? {
        get { return self.titleLabel.text }
        set { self.titleLabel.text = newValue }
    }

    // MARK: - 뷰

    /**
     NavigationBar 상단 좌측에 들어가는
     굵은 Title의 Label입니다.
     */
    private let titleLabel: YDSLabel = {
        let label = YDSLabel(style: .title2)
        label.textColor = YDSColor.textPrimary
        return label
    }()

    // MARK: - 메소드

    /**
     굵은 Title을 가진 TopBar(=NavigationBar)를 생성합니다.
     
     - Parameters:
        - title: NavigationBar 상단에 들어가는 굵은 title의 String 값입니다.
     */
    public init(title: String?) {
        super.init()
        self.title = title
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
        setLayouts()
    }

    /**
     각종 프로퍼티를 세팅합니다.
     */
    private func setProperties() {
        self.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.clear
        ]
    }

    /**
     레이아웃을 세팅합니다.
     */
    private func setLayouts() {
        setViewHierarchy()
    }

    /**
     뷰의 위계를 세팅합니다.
     */
    private func setViewHierarchy() {
        self.topItem?.setLeftBarButton(UIBarButtonItem(customView: titleLabel), animated: true)
    }

}
