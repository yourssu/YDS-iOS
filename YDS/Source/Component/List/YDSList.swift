//
//  YDSList.swift
//  YDS
//
//  Created by Yonghyun on 2022/05/02.
//

import UIKit

public class YDSList: UIView {
    
    // MARK: - 뷰
    
    /// subheader label을 담는 view
    private var subheaderView: UIView = {
        let view = UIView()
        return view
    }()
    
    /// subheader 텍스트를 보여주는 label
    private var subheaderLabel: UILabel = {
        let label = YDSLabel(style: .subtitle3)
        label.textColor = YDSColor.textSecondary
        return label
    }()
    
    /// ListItem, ListToggleItem을 담는 StackView
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.spacing = YDSTextFieldView.Dimension.subviewSpacing
        return stackView
    }()
    
    //  MARK: - 외부에서 지정할 수 있는 속성
    
    /// List의 Subheader
    public var subheader: String? {
        didSet {
            setNeedsLayout()
        }
    }
    
    // MARK: - 메소드

    /**
     초기화할 때 subheader를 설정할 수 있습니다.
     subheader가 값을 가지면 List의 subheader가 보이고
     subheader가 nil을 가지면 List의 subheader가 안 보입니다.
     */
    public init(subheader: String? = nil) {
        self.subheader = subheader
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 뷰를 세팅합니다.
    private func setupView() {
        setLayouts()
    }
    
    /// 레이아웃을 세팅합니다.
    private func setLayouts() {
        setViewHierarchy()
        setAutolayout()
    }
    
    /// 뷰의 위계를 세팅합니다.
    private func setViewHierarchy() {
        self.addSubview(subheaderView)
        subheaderView.addSubview(subheaderLabel)
        self.addSubview(stackView)
    }
    
    /// 뷰의 오토레이아웃을 세팅합니다.
    private func setAutolayout() {
        subheaderView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Dimension.Padding.vertical)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(Dimension.Subheader.height)
        }
        
        subheaderLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(Dimension.Subheader.verticalPadding)
            $0.leading.trailing.equalToSuperview().inset(Dimension.Padding.horizontal)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(subheaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(Dimension.Padding.vertical)
        }
    }
    
    /// subheader를 세팅합니다.
    private func setSubheader() {
        if subheader == nil {
            subheaderView.isHidden = true
            
            subheaderLabel.snp.updateConstraints {
                $0.top.bottom.equalToSuperview()
            }
            
            subheaderView.snp.updateConstraints {
                $0.height.equalTo(0)
            }
        } else {
            subheaderView.isHidden = false
            subheaderLabel.text = subheader
            
            subheaderLabel.snp.updateConstraints {
                $0.top.bottom.equalToSuperview().inset(Dimension.Subheader.verticalPadding)
            }
            
            subheaderView.snp.updateConstraints {
                $0.height.equalTo(Dimension.Subheader.height)
            }
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setSubheader()
        
        for view in stackView.arrangedSubviews {
            setSubviewWidth(view)
        }
    }
    
    /// List에 Item을 넣을 때 사용합니다.
    public func addArrangedSubview(_ views: UIView...) {
        for view in views {
            self.stackView.addArrangedSubview(view)
        }
    }
    
    /// ListItem 또는 ListToggleItem의 너비를 세팅합니다.
    private func setSubviewWidth(_ view: UIView) {
        view.snp.makeConstraints {
            $0.width.equalToSuperview()
        }
    }
    
    //  MARK: - 외부에서 접근할 수 없는 enum
    
    private enum Dimension {
        enum Padding {
            static let horizontal: CGFloat = 20
            static let vertical: CGFloat = 8
        }
        
        enum Subheader {
            static let height: CGFloat = 42
            static let verticalPadding: CGFloat = 12
        }
    }
}
