//
//  SwiftUIYDSImageArray.swift
//  YDS-Storybook
//
//  Created by 심상현 on 2023/09/04.
//

import SwiftUI
import YDS_SwiftUI

struct SwiftUIImage {
    let image: Image?
    let name: String
}

extension SwiftUIImage: CustomStringConvertible {
    var description: String {
        return self.name
    }
}

extension SwiftUIImage: Identifiable {
    var id: String {
        return self.name
    }
}

struct SwiftUIImages {
    let items: [SwiftUIImage]
    let description: String?
}

extension SwiftUIImages: Identifiable {
    var id: UUID {
        UUID()
    }
}

struct YDSSwiftUIImage {
    static let images = [
        SwiftUIImage(image: Image("profileImageSample1"), name: "profileImageOldang"),
        SwiftUIImage(image: Image("profileImageSample2"), name: "profileImageBunny"),
        SwiftUIImage(image: Image("profileImageSample3"), name: "profileImageHox"),
        SwiftUIImage(image: Image("profileImageSample4"), name: "profileImageWind"),
        SwiftUIImage(image: Image("profileImageSample5"), name: "profileImageBBuChoung"),
        SwiftUIImage(image: Image("profileImageSample6"), name: "profileImageDino")
    ]
}
