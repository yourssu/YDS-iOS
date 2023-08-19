//
//  Storybook.swift
//  YDS-Storybook
//
//  Created by 정지혁 on 2023/08/19.
//

import SwiftUI

protocol Storybook {
    associatedtype Content: View
    
    var title: String { get }
    var sampleView: Content { get }
    var divider: Content { get }
    var options: [Option] { get }
}

enum Option {
    
}
