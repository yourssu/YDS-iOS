//
//  YDSDoubleTitleTopBar.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/08/07.
//

import UIKit

/**
 YDS 스타일의 TopBar입니다.
 굵은 Title 글씨와 얇은 Title 글씨가 함께 들어간 TopBar가 필요할 때
 YDSDoubleTitleTopBar를 단독으로 사용할 수 있습니다.
 기본 TopBar에서 배경색, 투명도, 글씨 폰트, 컬러, 버튼 간격 등이 커스텀 되었습니다.
 */
public class YDSDoubleTitleTopBar: YDSTopBar {
    
    //  MARK: - 외부에서 지정할 수 있는 속성
    
    /**
     NavigationBar 상단에 들어가는
     굵은 Title의 String입니다.
     */
    public var title: String? {
        get {
            return self.titleLabel.text
        }
        set(inputValue) {
            self.titleLabel.text = inputValue
        }
    }
    
    /**
     NavigationBar 상단에 들어가는
     얇은 Title의 String입니다.
     */
    public var subtitle: String? {
        get {
            return self.subtitleLabel.text
        }
        set(inputValue) {
            self.subtitleLabel.text = inputValue
        }
    }
    
    
    //  MARK: - 뷰
    
    /**
     NavigationBar 상단 좌측에 들어가는
     굵은 Title의 Label입니다.
     */
    private let titleLabel: YDSLabel = {
        let label = YDSLabel(style: .title2)
        label.textColor = YDSColor.textPrimary
        return label
    }()
    
    /**
     NavigationBar 상단 좌측에 들어가는
     얇은 Title의 Label입니다.
     */
    private let subtitleLabel: YDSLabel = {
        let label = YDSLabel(style: .body2)
        label.textColor = YDSColor.textSecondary
        return label
    }()
    
    /**
     titleLabel과 subtitleLabel을 담는 StackView입니다.
     */
    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = Dimension.LabelStackView.spacing
        return stackView
    }()
    
    
    //  MARK: - 내부에서 사용되는 상수
    
    /**
     내부에서 사용되는 각종 레이아웃 관련 수치입니다.
     */
    private enum Dimension {
        static let height: CGFloat = 72
        
        enum LabelStackView {
            enum Margin {
                static let bottom: CGFloat = 8
            }
            static let spacing: CGFloat = 2
        }
        
        enum RightBarButton {
            static let height: CGFloat = 52
        }

    }
    
    /**
     굵은 Title과 얇은 Title을 가진 TopBar(=NavigationBar)를 생성합니다.
     
     - Parameters:
        - title: NavigationBar 상단에 들어가는 굵은 title의 String 값입니다.
        - subtitle: NavigationBar 상단에 들어가는 얇은 title의 String 값입니다.
     */
    public init(title: String?, subtitle: String?) {
        super.init()
        self.title = title
        self.subtitle = subtitle
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
            NSAttributedString.Key.foregroundColor: UIColor.clear,
        ]
    }
    
    /**
     레이아웃을 세팅합니다.
     */
    private func setLayouts() {
        setViewHierarchy()
        setAutolayout()
    }
    
    /**
     뷰의 위계를 세팅합니다.
     */
    private func setViewHierarchy() {
        [subtitleLabel, titleLabel].forEach {
            labelStackView.addArrangedSubview($0)
        }
        
        self.topItem?.setLeftBarButton(UIBarButtonItem(customView: labelStackView),
                                       animated: true)
    }
    
    /**
     오토레이아웃을 세팅합니다.
     */
    private func setAutolayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(Dimension.height)
        }
    }
}


extension YDSDoubleTitleTopBar {
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        setHeight()
        removeButtonBarConstraints()
        setButtonBarConstraints()
    }
    
    /**
     NavigationBar와
     그 하위의 contentView, backgroundView의 높이를 설정합니다.
     */
    private func setHeight() {
        [self, contentView, backgroundView].forEach {
            $0?.frame.size.height = Dimension.height
        }
    }
    
    /**
     NavigationBar 내부의 ButtonBar 관련 Constraint 중
     높이에 관련해 충돌을 일으킬 수 있는 일부 Constraint를 제거합니다.
     */
    private func removeButtonBarConstraints() {
        contentView?.layoutGuides
            .filter { $0.description.contains("BarGuide")}
            .forEach {
                $0.constraintsAffectingLayout(for: .vertical)
                    .forEach {
                        if $0.description.contains("height") {
                            if $0.description.contains("LeadingBarGuide") {
                                $0.isActive = false
                            }
                            
                            if $0.description.contains("TrailingBarGuide") {
                                $0.constant = Dimension.RightBarButton.height
                            }
                        }
                        
                        if $0.description.contains("BarGuide") && ($0.firstAttribute == .top) {
                            $0.isActive = false
                        }
                    }
            }
    }
    
    /**
     NavigationBar 내부의 ButtonBar의 Constraint를
     필요에 따라 설정해줍니다.
     */
    private func setButtonBarConstraints() {
        leftButtonBar?.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-Dimension.LabelStackView.Margin.bottom)
        }
        
        rightButtonBar?.snp.makeConstraints {
            $0.bottom.equalToSuperview()
        }
    }
    
}
