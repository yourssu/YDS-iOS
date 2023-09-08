//
//  ProfileImageView.swift
//  YDS-Storybook
//
//  Created by 심상현 on 2023/09/04.
//
// 

import SwiftUI
import YDS_SwiftUI

struct ProfileImagePageView: View {
    let title: String = "ProfileImageView"

    @State var imageSelectedIndex: Int = 0
    @State var sizeSelectedIndex: Int = 4
    @State var image: SwiftUIImage? = YDSSwiftUIImage.images[0]

    var body: some View {
        StorybookPageView(sample: {
            VStack {
                if let image = image?.image {
                    YDSProfileImageView(image: image, size: YDSProfileImageView.ProfileImageViewSize.allCases[sizeSelectedIndex])
                }
            }
        }, options: [
            Option.optionalImage(description: "image", images: YDSSwiftUIImage.images, selectedImage: $image),
            Option.enum(description: "size", cases: YDSProfileImageView.ProfileImageViewSize.allCases, selectedIndex: $sizeSelectedIndex),
        ])
        .navigationTitle(title)
    }
}

extension YDSProfileImageView.ProfileImageViewSize: CaseIterable {
    public static var allCases: [YDSProfileImageView.ProfileImageViewSize] =
    [.extraSmall, .small, .medium, .large, .extraLarge]
}

struct ProfileImagePageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImagePageView()
    }
}
