//
//  YDSProfileImageView.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/08/01.
//

import UIKit

public class YDSProfileImageView: UIImageView {

    @SetNeeds(.layout) public var size: ProfileImageViewSize = .small

    public enum ProfileImageViewSize: Int {
        case extraSmall = 24
        case small = 32
        case medium = 48
        case large = 72
        case extraLarge = 96
    }

    public init() {
        super.init(frame: CGRect.zero)
        setupViews()
        setImageSize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        self.contentMode = .scaleAspectFill
    }

    private func setImageSize() {
        self.snp.updateConstraints {
            $0.height.width.equalTo(size.rawValue)
        }

        setSquirclePathAccordingToSize()
    }

    /**
     size에 따른 squircle path를 만들고
     마스킹과 테두리를 적용시킵니다.
     */
    private func setSquirclePathAccordingToSize() {
        let path = makeSquirclePath(CGFloat(size.rawValue), insetRatio: 0.2)

        setMaskLayer(path: path)
        setBorderLayer(path: path)
    }

    /**
     mask layer를 만들고 적용시킵니다.
     */
    private func setMaskLayer(path: UIBezierPath) {
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }

    /**
     border layer를 만들고 적용시킵니다.
     */
    private func setBorderLayer(path: UIBezierPath) {
        let newBorderLayer = CAShapeLayer()
        newBorderLayer.frame = self.bounds
        newBorderLayer.path = path.cgPath
        newBorderLayer.fillColor = UIColor.clear.cgColor
        newBorderLayer.lineWidth = YDSConstant.Border.normal
        newBorderLayer.strokeColor = YDSColor.borderNormal.cgColor

        if let oldBorderLayer = borderLayer {
            self.layer.replaceSublayer(oldBorderLayer, with: newBorderLayer)
        } else {
            self.layer.addSublayer(newBorderLayer)
        }

        borderLayer = newBorderLayer
    }

    /**
     현재 상태의 borderLayer를 저장합니다.
     size가 바뀜에 따라 새 borderLayer가 필요해지면
     replaceSublayer() 함수에서
     이 변수에 저장된 주소를 이용해
     기존의 borderLayer를 새 borderLayer로 바꿔줍니다.
     */
    private var borderLayer: CALayer?

    /**
     width는 스쿼클의 너비, insetRatio는 곡률(0에서 1 사이로 넣어주세요)입니다.
     디자인 요구 사안에 맞는 UIBezierPath를 return합니다.
     벡터 다루기 싫어서 일러스트레이터 공부 안한건데
     iOS에서 벡터를 만지고 있을 줄은 몰랐습니다.
     */
    private func makeSquirclePath(_ width: CGFloat, insetRatio: CGFloat) -> UIBezierPath {
        let radius = width/2

        if insetRatio > 1 || insetRatio < 0 {
            assertionFailure("""
            makeSquirclePath()
            insetRatio 값은 0에서 1 사이로 넣어주세요.
            """)
        }

        let topPoint = CGPoint(x: radius, y: 0)
        let rightPoint = CGPoint(x: radius*2, y: radius)
        let bottomPoint = CGPoint(x: radius, y: radius*2)
        let leftPoint = CGPoint(x: 0, y: radius)

        let inset = radius*insetRatio
        let topLeftControlPoint = CGPoint(x: inset, y: 0)
        let topRightControlPoint = CGPoint(x: radius*2-inset, y: 0)
        let rightTopControlPoint = CGPoint(x: radius*2, y: inset)
        let rightBottomControlPoint = CGPoint(x: radius*2, y: radius*2-inset)
        let bottomRightControlPoint = CGPoint(x: radius*2-inset, y: radius*2)
        let bottomLeftControlPoint = CGPoint(x: inset, y: radius*2)
        let leftBottomControlPoint = CGPoint(x: 0, y: radius*2-inset)
        let leftTopControlPoint = CGPoint(x: 0, y: inset)

        let path = UIBezierPath()
        path.move(to: topPoint)
        path.addCurve(
            to: rightPoint,
            controlPoint1: topRightControlPoint,
            controlPoint2: rightTopControlPoint
        )
        path.addCurve(
            to: bottomPoint,
            controlPoint1: rightBottomControlPoint,
            controlPoint2: bottomRightControlPoint
        )
        path.addCurve(
            to: leftPoint,
            controlPoint1: bottomLeftControlPoint,
            controlPoint2: leftBottomControlPoint
        )
        path.addCurve(
            to: topPoint,
            controlPoint1: leftTopControlPoint,
            controlPoint2: topLeftControlPoint
        )
        path.close()

        return path
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        setImageSize()
    }
}
