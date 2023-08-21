//
//  SwiftUISwiftUIIcon(icon: YDS_SwiftUI.YDSIconArray.swift
//  YDS-Storybook
//
//  Created by 김규철 on 2023/08/18.
//

import SwiftUI
import YDS_SwiftUI

struct SwiftUIIcon {
    let icon: Image?
    let name: String
}

extension SwiftUIIcon: CustomStringConvertible {
    var description: String {
        return self.name
    }
}

extension SwiftUIIcon: Identifiable {
    var id: String {
        return self.name
    }
}

struct SwiftUIIcons {
    let items: [SwiftUIIcon]
    let description: String?
}

extension SwiftUIIcons: Identifiable {
    var id: UUID {
        UUID()
    }
}

struct YDSSwiftUIIcon {
    static let icons = [
        SwiftUIIcon(icon: YDSIcon.adbadgeFilled, name: "ic_adbadge_filled"),
        SwiftUIIcon(icon: YDSIcon.adbadgeLine, name: "ic_adbadge_line"),
        SwiftUIIcon(icon: YDSIcon.arrowDownLine, name: "ic_arrow_down_line"),
        SwiftUIIcon(icon: YDSIcon.arrowLeftLine, name: "ic_arrow_left_line"),
        SwiftUIIcon(icon: YDSIcon.arrowRightLine, name: "ic_arrow_right_line"),
        SwiftUIIcon(icon: YDSIcon.arrowUpLine, name: "ic_arrow_up_line"),
        SwiftUIIcon(icon: YDSIcon.bellFilled, name: "ic_bell_filled"),
        SwiftUIIcon(icon: YDSIcon.bellLine, name: "ic_bell_line"),
        SwiftUIIcon(icon: YDSIcon.bellmuteLine, name: "ic_bellmute_line"),
        SwiftUIIcon(icon: YDSIcon.boardFilled, name: "ic_board_filled"),
        SwiftUIIcon(icon: YDSIcon.boardLine, name: "ic_board_line"),
        SwiftUIIcon(icon: YDSIcon.bookFilled, name: "ic_book_filled"),
        SwiftUIIcon(icon: YDSIcon.bookLine, name: "ic_book_line"),
        SwiftUIIcon(icon: YDSIcon.calendarFilled, name: "ic_calendar_filled"),
        SwiftUIIcon(icon: YDSIcon.calendarLine, name: "ic_calendar_line"),
        SwiftUIIcon(icon: YDSIcon.cameraFilled, name: "ic_camera_filled"),
        SwiftUIIcon(icon: YDSIcon.cameraLine, name: "ic_camera_line"),
        SwiftUIIcon(icon: YDSIcon.cameracircleLine, name: "ic_cameracircle_line"),
        SwiftUIIcon(icon: YDSIcon.checkLine, name: "ic_check_line"),
        SwiftUIIcon(icon: YDSIcon.checkcircleFilled, name: "ic_checkcircle_filled"),
        SwiftUIIcon(icon: YDSIcon.checkcircleLine, name: "ic_checkcircle_line"),
        SwiftUIIcon(icon: YDSIcon.clipLine, name: "ic_clip_line"),
        SwiftUIIcon(icon: YDSIcon.commentFilled, name: "ic_comment_filled"),
        SwiftUIIcon(icon: YDSIcon.commentLine, name: "ic_comment_line"),
        SwiftUIIcon(icon: YDSIcon.dotbadgeLine, name: "ic_dotbadge_line"),
        SwiftUIIcon(icon: YDSIcon.dotsHorizontalLine, name: "ic_dots_horizontal_line"),
        SwiftUIIcon(icon: YDSIcon.dotsVerticalLine, name: "ic_dots_vertical_line"),
        SwiftUIIcon(icon: YDSIcon.emojiaddLine, name: "ic_emojiadd_line"),
        SwiftUIIcon(icon: YDSIcon.eyeclosedLine, name: "ic_eyeclosed_line"),
        SwiftUIIcon(icon: YDSIcon.eyeopenLine, name: "ic_eyeopen_line"),
        SwiftUIIcon(icon: YDSIcon.foodFilled, name: "ic_food_filled"),
        SwiftUIIcon(icon: YDSIcon.foodLine, name: "ic_food_line"),
        SwiftUIIcon(icon: YDSIcon.foodcalendarFilled, name: "ic_foodcalendar_filled"),
        SwiftUIIcon(icon: YDSIcon.foodcalendarLine, name: "ic_foodcalendar_line"),
        SwiftUIIcon(icon: YDSIcon.groundFilled, name: "ic_ground_filled"),
        SwiftUIIcon(icon: YDSIcon.groundLine, name: "ic_ground_line"),
        SwiftUIIcon(icon: YDSIcon.heartFilled, name: "ic_heart_filled"),
        SwiftUIIcon(icon: YDSIcon.heartLine, name: "ic_heart_line"),
        SwiftUIIcon(icon: YDSIcon.homeFilled, name: "ic_home_filled"),
        SwiftUIIcon(icon: YDSIcon.homeLine, name: "ic_home_line"),
        SwiftUIIcon(icon: YDSIcon.listLine, name: "ic_list_line"),
        SwiftUIIcon(icon: YDSIcon.lockFilled, name: "ic_lock_filled"),
        SwiftUIIcon(icon: YDSIcon.lockLine, name: "ic_lock_line"),
        SwiftUIIcon(icon: YDSIcon.newFilled, name: "ic_new_filled"),
        SwiftUIIcon(icon: YDSIcon.newLine, name: "ic_new_line"),
        SwiftUIIcon(icon: YDSIcon.noticeFilled, name: "ic_notice_filled"),
        SwiftUIIcon(icon: YDSIcon.noticeLine, name: "ic_notice_line"),
        SwiftUIIcon(icon: YDSIcon.penFilled, name: "ic_pen_filled"),
        SwiftUIIcon(icon: YDSIcon.penLine, name: "ic_pen_line"),
        SwiftUIIcon(icon: YDSIcon.personFilled, name: "ic_person_filled"),
        SwiftUIIcon(icon: YDSIcon.personLine, name: "ic_person_line"),
        SwiftUIIcon(icon: YDSIcon.personcircleLine, name: "ic_personcircle_line"),
        SwiftUIIcon(icon: YDSIcon.pictureFilled, name: "ic_picture_filled"),
        SwiftUIIcon(icon: YDSIcon.pictureLine, name: "ic_picture_line"),
        SwiftUIIcon(icon: YDSIcon.pinFilled, name: "ic_pin_filled"),
        SwiftUIIcon(icon: YDSIcon.pinLine, name: "ic_pin_line"),
        SwiftUIIcon(icon: YDSIcon.playcircleFilled, name: "ic_playcircle_filled"),
        SwiftUIIcon(icon: YDSIcon.playcircleLine, name: "ic_playcircle_line"),
        SwiftUIIcon(icon: YDSIcon.plusLine, name: "ic_plus_line"),
        SwiftUIIcon(icon: YDSIcon.rankFilled, name: "ic_rank_filled"),
        SwiftUIIcon(icon: YDSIcon.rankLine, name: "ic_rank_line"),
        SwiftUIIcon(icon: YDSIcon.recommentLine, name: "ic_recomment_line"),
        SwiftUIIcon(icon: YDSIcon.refreshLine, name: "ic_refresh_line"),
        SwiftUIIcon(icon: YDSIcon.savecircleFilled, name: "ic_savecircle_filled"),
        SwiftUIIcon(icon: YDSIcon.savecircleLine, name: "ic_savecircle_line"),
        SwiftUIIcon(icon: YDSIcon.schoolcalendarFilled, name: "ic_schoolcalendar_filled"),
        SwiftUIIcon(icon: YDSIcon.schoolcalendarLine, name: "ic_schoolcalendar_line"),
        SwiftUIIcon(icon: YDSIcon.searchLine, name: "ic_search_line"),
        SwiftUIIcon(icon: YDSIcon.sharecircleFilled, name: "ic_sharecircle_filled"),
        SwiftUIIcon(icon: YDSIcon.sharecircleLine, name: "ic_sharecircle_line"),
        SwiftUIIcon(icon: YDSIcon.starFilled, name: "ic_star_filled"),
        SwiftUIIcon(icon: YDSIcon.starLine, name: "ic_star_line"),
        SwiftUIIcon(icon: YDSIcon.thumbDownFilled, name: "ic_thumb_down_filled"),
        SwiftUIIcon(icon: YDSIcon.thumbDownLine, name: "ic_thumb_down_line"),
        SwiftUIIcon(icon: YDSIcon.thumbUpFilled, name: "ic_thumb_up_filled"),
        SwiftUIIcon(icon: YDSIcon.thumbUpLine, name: "ic_thumb_up_line"),
        SwiftUIIcon(icon: YDSIcon.timecalendarFilled, name: "ic_timecalendar_filled"),
        SwiftUIIcon(icon: YDSIcon.timecalendarLine, name: "ic_timecalendar_line"),
        SwiftUIIcon(icon: YDSIcon.trashcanFilled, name: "ic_trashcan_filled"),
        SwiftUIIcon(icon: YDSIcon.trashcanLine, name: "ic_trashcan_line"),
        SwiftUIIcon(icon: YDSIcon.warningcircleFilled, name: "ic_warningcircle_filled"),
        SwiftUIIcon(icon: YDSIcon.warningcircleLine, name: "ic_warningcircle_line"),
        SwiftUIIcon(icon: YDSIcon.xLine, name: "ic_x_line"),
        SwiftUIIcon(icon: YDSIcon.xcircleFilled, name: "ic_xcircle_filled")
    ]
}
