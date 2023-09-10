//
//  YDSProfileImageView.swift
//  YDS-SwiftUI
//
//  Created by 심상현 on 2023/09/08.
//

import SwiftUI
import YDS_Essential

/// 이미지를 ProfileImage 형태로 변환하는 Shape
private struct ProfileImageReshaper: Shape {
    var insetRatio: CGFloat // 내부 여백 비율
    var width: CGFloat // 이미지 너비

    func path(in rect: CGRect) -> Path {
        let radius = width / 2
        let inset = radius * insetRatio

        let topPoint = CGPoint(x: radius, y: 0)
        let rightPoint = CGPoint(x: radius * 2, y: radius)
        let bottomPoint = CGPoint(x: radius, y: radius * 2)
        let leftPoint = CGPoint(x: 0, y: radius)

        var path = Path()
        path.move(to: topPoint)
        path.addCurve(
            to: rightPoint,
            control1: CGPoint(x: radius * 2 - inset, y: 0),
            control2: CGPoint(x: radius * 2, y: inset)
        )
        path.addCurve(
            to: bottomPoint,
            control1: CGPoint(x: radius * 2, y: radius * 2 - inset),
            control2: CGPoint(x: radius * 2 - inset, y: radius * 2)
        )
        path.addCurve(
            to: leftPoint,
            control1: CGPoint(x: inset, y: radius * 2),
            control2: CGPoint(x: 0, y: radius * 2 - inset)
        )
        path.addCurve(
            to: topPoint,
            control1: CGPoint(x: 0, y: inset),
            control2: CGPoint(x: inset, y: 0)
        )

        return path
    }
}

public struct YDSProfileImageView: View {
    /// 프로필 이미지 크기
    public enum ProfileImageViewSize {
        case extraSmall
        case small
        case medium
        case large
        case extraLarge
        case custom(CGFloat)

        fileprivate var size: CGFloat {
            switch self {
            case .extraSmall: return 24
            case .small: return 32
            case .medium: return 48
            case .large: return 72
            case .extraLarge: return 96
            case let .custom(value): return value
            }
        }
    }

    private let image: Image?
    private let size: ProfileImageViewSize
    private var color = YDSColor.borderNormal
    private var width = YDSConstant.Border.normal

    /**
     프로필 이미지와 크기를 설정하는 초기화 함수
     
     - Parameters:
        - image: 표시할 이미지
        - size: 이미지의 크기. `ProfileImageViewSize` enum 값을 사용
     
     - Returns: YDSProfileImageView 인스턴스
     */
    public init(image: Image, size: ProfileImageViewSize?) {
        self.image = image
        self.size = size ?? .small
    }

    /**
     테두리 색상과 두께를 설정
     
     - Parameters:
        - color: 테두리 색상
        - width: 테두리 두께
     
     - Returns: 테두리가 설정된 YDSProfileImageView 인스턴스
     */
    public func border(color: Color, width: CGFloat) -> YDSProfileImageView {
        var view = self
        view.color = color
        view.width = width
        return view
    }

    /**
     초기화 실패 시 호출되는 이니셜라이저
     
     - Returns: nil
     */
    init?() {
        fatalError("initialize")
    }

    public var body: some View {
        if let image = image {
            image
                .resizable()
                .frame(width: size.size, height: size.size)
                .clipShape(ProfileImageReshaper(insetRatio: 0.2, width: size.size))
                .overlay(ProfileImageReshaper(insetRatio: 0.2, width: size.size)
                    .stroke(color, lineWidth: width))
        }
    }
}

struct YDSProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        YDSProfileImageView(image: Image(""), size: YDSProfileImageView.ProfileImageViewSize.large)
    }
}
