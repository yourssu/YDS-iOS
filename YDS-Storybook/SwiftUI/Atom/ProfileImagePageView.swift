//
//  ProfileImageView.swift
//  YDS-Storybook
//
//  Created by 심상현 on 2023/09/04.
//
// 

import SwiftUI
import YDS_SwiftUI

fileprivate struct ProfileImageReshaper: Shape {
    var insetRatio: CGFloat
    var width: CGFloat

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

struct ProfileImagePageView: View {
    let title: String = "ProfileImageView"

    @State var imageSelectedIndex: Int = 0
    @State var sizeSelectedIndex: Int = 4
    @State var image: SwiftUIImage? = YDSSwiftUIImage.images[0]

    enum ProfileImageViewSize: CGFloat {
        case extraSmall = 24
        case small = 32
        case medium = 48
        case large = 72
        case extraLarge = 96
    }

    var body: some View {
        StorybookPageView(sample: {
            VStack {
                if let image = image?.image {
                    image
                        .resizable()
                        .frame(width: ProfileImageViewSize.allCases[sizeSelectedIndex].rawValue,
                            height: ProfileImageViewSize.allCases[sizeSelectedIndex].rawValue)
                        .clipShape(ProfileImageReshaper(insetRatio: 0.2, width: ProfileImageViewSize.allCases[sizeSelectedIndex].rawValue))
                        .overlay(ProfileImageReshaper(insetRatio: 0.2, width: ProfileImageViewSize.allCases[sizeSelectedIndex].rawValue)
                            .stroke(YDSColor.borderNormal, lineWidth: YDSConstant.Border.normal))
                }
            }
        }, options: [
            Option.optionalImage(description: "image", images: YDSSwiftUIImage.images, selectedImage: $image),
            Option.enum(description: "size", cases: ProfileImageViewSize.allCases, selectedIndex: $sizeSelectedIndex)
        ])
        .navigationTitle(title)
    }
}

extension ProfileImagePageView.ProfileImageViewSize: CaseIterable {
    static var allCases: [ProfileImagePageView.ProfileImageViewSize] =
    [.extraSmall, .small, .medium, .large, .extraLarge]
}

struct ProfileImagePageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImagePageView()
    }
}
