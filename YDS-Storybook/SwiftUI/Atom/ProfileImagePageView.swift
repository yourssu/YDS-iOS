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
    @State var code: String = ""

    var body: some View {
        let contentView = StorybookPageView(
            sample: {
                VStack {
                    image?.image.map {
                        YDSProfileImageView(
                            image: $0,
                            size: YDSProfileImageView.ProfileImageViewSize.allCases[sizeSelectedIndex])
                    }
                }
            }, options: [
                Option.optionalImage(
                    description: "image",
                    images: YDSSwiftUIImage.images,
                    selectedImage: $image),
                Option.enum(
                    description: "size",
                    cases: YDSProfileImageView.ProfileImageViewSize.allCases,
                    selectedIndex: $sizeSelectedIndex)
            ],
            code: $code
        )
        .navigationTitle(title)
        .onAppear {
            updateCodeText()
        }

        // onChange 관련 함수가 iOS 17.0부터 deprecated 되어 분기
        if #available(iOS 17.0, *) {
            contentView
                .onChange(of: image) { _ in updateCodeText() }
                .onChange(of: sizeSelectedIndex) { _ in updateCodeText() }
        } else {
            contentView
                .onChange(of: image, perform: { _ in updateCodeText() })
                .onChange(of: image, perform: { _ in updateCodeText() })
        }
    }

    func updateCodeText() {
        let imageName = image?.name ?? ""
        let sizeName = YDSProfileImageView.ProfileImageViewSize.allCases[sizeSelectedIndex]
        code = """
YDSProfileImageView(
    image: \(imageName),
    size: .\(sizeName)
)
"""
    }
}

extension SwiftUIImage: Equatable {
    public static func == (lhs: SwiftUIImage, rhs: SwiftUIImage) -> Bool {
        return lhs.name == rhs.name
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
