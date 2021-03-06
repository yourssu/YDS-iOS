//
//  YDSTypographyArray.swift
//  YDS-Storybook
//
//  Created by Gyuni on 2021/09/14.
//

import YDS

struct Typographies {
    let items: [String.TypoStyle]
    let description: String?
}

let displayTypographies = Typographies(
    items: [
        .display1, .display2
    ],
    description: "Display"
)

let titleTypographies = Typographies(
    items: [
        .title1, .title2, .title3
    ],
    description: "Title"
)

let subtitleTypographies = Typographies(
    items: [
        .subtitle1, .subtitle2, .subtitle3
    ],
    description: "Subtitle"
)

let bodyTypographies = Typographies(
    items: [
        .body1, .body2
    ],
    description: "Body"
)

let buttonTypographies = Typographies(
    items: [
        .button0, .button1, .button2, .button3, .button4
    ],
    description: "Button"
)

let captionTypographies = Typographies(
    items: [
        .caption0, .caption1, .caption2
    ],
    description: "Caption"
)

let typographies = [
    displayTypographies,
    titleTypographies,
    subtitleTypographies,
    bodyTypographies,
    buttonTypographies,
    captionTypographies
]
