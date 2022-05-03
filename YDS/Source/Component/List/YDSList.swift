//
//  YDSList.swift
//  YDS
//
//  Created by Yonghyun on 2022/05/02.
//

import UIKit

public class YDSList: UIView {
    
    private var subheaderView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var subheader: UILabel = {
        let label = YDSLabel(style: .subtitle3)
        label.textColor = YDSColor.textSecondary
        return label
    }()
    
    public var subheaderTitle: String? {
        didSet {
            setNeedsLayout()
        }
    }
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = YDSTextFieldView.Dimension.subviewSpacing
        return stackView
    }()
    
    public init(subheaderTitle: String? = nil) {
        self.subheaderTitle = subheaderTitle
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 뷰를 세팅합니다.
    private func setupView() {
        setLayouts()
        setProperties()
    }
    
    /// 레이아웃을 세팅합니다.
    private func setLayouts() {
        setViewHierarchy()
        setAutolayout()
    }
    
    /// 뷰의 위계를 세팅합니다.
    private func setViewHierarchy() {
        self.addSubview(subheaderView)
        subheaderView.addSubview(subheader)
        self.addSubview(stackView)
    }
    
    /// 뷰의 오토레이아웃을 세팅합니다.
    private func setAutolayout() {
        subheaderView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Dimension.Padding.vertical)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(Dimension.Subheader.height)
        }
        
        subheader.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(Dimension.Subheader.verticalPadding)
            $0.leading.trailing.equalToSuperview().inset(Dimension.Padding.horizontal)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(subheaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(Dimension.Padding.vertical)
        }
    }
    
    /// 뷰의 프로퍼티를 세팅합니다.
    private func setProperties() {
        self.backgroundColor = .systemBackground
    }
    
    private func setSubheader() {
        if subheaderTitle == nil {
            subheaderView.snp.updateConstraints {
                $0.height.equalTo(0)
            }
        } else {
            subheader.text = subheaderTitle
            subheaderView.snp.updateConstraints {
                $0.height.equalTo(Dimension.Subheader.height)
            }
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setSubheader()
        
        for view in stackView.arrangedSubviews {
            if let view = view as? YDSListProtocol {
                view.setWidth()
            }
        }
    }
    
    public func addArrangedSubview(_ views: UIView...) {
        for view in views {
            self.stackView.addArrangedSubview(view)
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
