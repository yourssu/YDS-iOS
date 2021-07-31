//
//  YDSProfileImageView.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/08/01.
//

import UIKit

public class YDSProfileImageView: UIImageView {
    
    public var size: ImageSize = .small {
        didSet { setImageSize() }
    }
    
    public enum ImageSize: Int {
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
    
    private func setSquirclePathAccordingToSize() {
        let path = squirclePath(CGFloat(size.rawValue))
        
        setMaskLayer(path: path)
        setBorderLayer(path: path)
    }
    
    private func setMaskLayer(path: UIBezierPath) {
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
    
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
    
    private var borderLayer: CALayer?

    private func squirclePath(_ width: CGFloat) -> UIBezierPath {
        let controlPoint1 = CGPoint(x: width*6/100, y: 0)
        let controlPoint2 = CGPoint(x: width-width*6/100, y: 0)
        let controlPoint3 = CGPoint(x: width, y: width*6/100)
        let controlPoint4 = CGPoint(x: width, y: width-width*6/100)
        let controlPoint5 = CGPoint(x: width-width*6/100, y: width)
        let controlPoint6 = CGPoint(x: width*6/100, y: width)
        let controlPoint7 = CGPoint(x: 0, y: width-width*6/100)
        let controlPoint8 = CGPoint(x: 0, y: width*6/100)
        
        let point1 = CGPoint(x: width/3, y: 0)
        let point2 = CGPoint(x: width-width/3, y: 0)
        let point3 = CGPoint(x: width, y: width/3)
        let point4 = CGPoint(x: width, y: width-width/3)
        let point5 = CGPoint(x: width-width/3, y: width)
        let point6 = CGPoint(x: width/3, y: width)
        let point7 = CGPoint(x: 0, y: width-width/3)
        let point8 = CGPoint(x: 0, y: width/3)
        
        let path = UIBezierPath()
        path.move(to: point8)
        path.addCurve(to: point1, controlPoint1: controlPoint8, controlPoint2: controlPoint1)
        path.addCurve(to: point2, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        path.addCurve(to: point3, controlPoint1: controlPoint2, controlPoint2: controlPoint3)
        path.addCurve(to: point4, controlPoint1: controlPoint3, controlPoint2: controlPoint4)
        path.addCurve(to: point5, controlPoint1: controlPoint4, controlPoint2: controlPoint5)
        path.addCurve(to: point6, controlPoint1: controlPoint5, controlPoint2: controlPoint6)
        path.addCurve(to: point7, controlPoint1: controlPoint6, controlPoint2: controlPoint7)
        path.addCurve(to: point8, controlPoint1: controlPoint7, controlPoint2: controlPoint8)
        path.close()
    
        return path
    }

}
