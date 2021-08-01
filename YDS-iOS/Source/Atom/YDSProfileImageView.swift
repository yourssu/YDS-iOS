//
//  YDSProfileImageView.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/08/01.
//

import UIKit

public class YDSProfileImageView: UIImageView {
    
    public var size: ProfileImageViewSize = .small {
        didSet { setImageSize() }
    }
    
    public enum ProfileImageViewSize: Int {
        case small = 36
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
    
    //  setSquirclePathAccordingToSize()
    //  size에 따른 squircle path를 만들고
    //  마스킹과 테두리를 적용시킵니다.
    private func setSquirclePathAccordingToSize() {
        let path = squirclePath(CGFloat(size.rawValue))
        
        setMaskLayer(path: path)
        setBorderLayer(path: path)
    }
    
    //  setMaskLayer()
    //  mask layer를 만들고 적용시킵니다.
    private func setMaskLayer(path: UIBezierPath) {
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
    
    //  setBorderLayer()
    //  border layer를 만들고 적용시킵니다.
    private func setBorderLayer(path: UIBezierPath) {
        let newBorderLayer = CAShapeLayer()
        newBorderLayer.frame = self.bounds
        newBorderLayer.path = path.cgPath
        newBorderLayer.fillColor = UIColor.clear.cgColor
        newBorderLayer.lineWidth = Constant.Border.thin
        newBorderLayer.strokeColor = YDSColor.borderNormal.cgColor
        
        if let oldBorderLayer = borderLayer {
            self.layer.replaceSublayer(oldBorderLayer, with: newBorderLayer)
        } else {
            self.layer.addSublayer(newBorderLayer)
        }
        
        borderLayer = newBorderLayer
    }
    
    //  borderLayer: CALayer?
    //  현재 상태의 borderLayer를 저장합니다.
    //  size가 바뀜에 따라 새 borderLayer가 필요해지면
    //  replaceSublayer() 함수에서
    //  이 변수에 저장된 주소를 이용해
    //  기존의 borderLayer를 새 borderLayer로 바꿔줍니다.
    private var borderLayer: CALayer?

    //  squirclePath()
    //  디자인 요구 사안에 맞는 UIBezierPath를 return합니다.
    //  벡터 다루기 싫어서 일러스트레이터 공부 안한건데
    //  iOS에서 벡터를 만지고 있을 줄은 몰랐습니다.
    private func squirclePath(_ width: CGFloat) -> UIBezierPath {
        let point: [CGPoint] = [
            CGPoint(x: width/3, y: 0),
            CGPoint(x: width-width/3, y: 0),
            CGPoint(x: width, y: width/3),
            CGPoint(x: width, y: width-width/3),
            CGPoint(x: width-width/3, y: width),
            CGPoint(x: width/3, y: width),
            CGPoint(x: 0, y: width-width/3),
            CGPoint(x: 0, y: width/3),
        ]
        
        let controlPoint: [CGPoint] = [
            CGPoint(x: width*6/100, y: 0),
            CGPoint(x: width-width*6/100, y: 0),
            CGPoint(x: width, y: width*6/100),
            CGPoint(x: width, y: width-width*6/100),
            CGPoint(x: width-width*6/100, y: width),
            CGPoint(x: width*6/100, y: width),
            CGPoint(x: 0, y: width-width*6/100),
            CGPoint(x: 0, y: width*6/100),
        ]
        
        let path = UIBezierPath()
        path.move(to: point[0])
        for i in 1...point.count {
            path.addCurve(
                to: point[i%point.count],
                controlPoint1: controlPoint[(i-1)%controlPoint.count],
                controlPoint2: controlPoint[i%controlPoint.count]
            )
        }
        path.close()
    
        return path
    }

}
