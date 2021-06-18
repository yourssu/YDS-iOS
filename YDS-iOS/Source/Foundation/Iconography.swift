//
//  Iconography.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/06/18.
//

import UIKit

public class ic {
    
    fileprivate static let bundle = Bundle(for: ic.self)
    
    public enum adbadge {
        public static var filled: UIImage { .load(name: "ic_adbadge_filled") }
        public static var line: UIImage { .load(name: "ic_adbadge_line") }
    }
    
    public enum arrow {
        public enum down {
            public static var line: UIImage { .load(name: "ic_arrow_down_line") }
        }
        public enum left {
            public static var line: UIImage { .load(name: "ic_arrow_left_line") }
        }
        public enum right {
            public static var line: UIImage { .load(name: "ic_arrow_right_line") }
        }
        public enum up {
            public static var line: UIImage { .load(name: "ic_arrow_up_line") }
        }
    }
    
    public enum bell {
        public static var filled: UIImage { .load(name: "ic_bell_filled") }
        public static var line: UIImage { .load(name: "ic_bell_line") }
    }
    
    public enum bellmute {
        public static var line: UIImage { .load(name: "ic_bellmute_line") }
    }
    
    public enum board {
        public static var filled: UIImage { .load(name: "ic_board_filled") }
        public static var line: UIImage { .load(name: "ic_board_line") }
    }
    
    public enum book {
        public static var filled: UIImage { .load(name: "ic_book_filled") }
        public static var line: UIImage { .load(name: "ic_book_line") }
    }
    
    public enum calendar {
        public static var filled: UIImage { .load(name: "ic_calendar_filled") }
        public static var line: UIImage { .load(name: "ic_calendar_line") }
    }
    
    public enum camera {
        public static var filled: UIImage { .load(name: "ic_camera_filled") }
        public static var line: UIImage { .load(name: "ic_camera_line") }
    }
    
    public enum cameracircle {
        public static var line: UIImage { .load(name: "ic_cameracircle_line") }
    }
    
    public enum check {
        public static var line: UIImage { .load(name: "ic_check_line") }
    }
    
    public enum checkcircle {
        public static var filled: UIImage { .load(name: "ic_checkcircle_filled") }
        public static var line: UIImage { .load(name: "ic_checkcircle_line") }
    }
    
    public enum clip {
        public static var line: UIImage { .load(name: "ic_clip_line") }
    }
    
    public enum comment {
        public static var filled: UIImage { .load(name: "ic_comment_filled") }
        public static var line: UIImage { .load(name: "ic_comment_line") }
    }
    
    public enum dotbadge {
        public static var line: UIImage { .load(name: "ic_dotbadge_line") }
    }
    
    public enum dots {
        public enum horizontal {
            public static var line: UIImage { .load(name: "ic_dots_horizontal_line") }
        }
        public enum vertical {
            public static var line: UIImage { .load(name: "ic_dots_vertical_line") }
        }
    }
    
    public enum food {
        public static var filled: UIImage { .load(name: "ic_food_filled") }
        public static var line: UIImage { .load(name: "ic_food_line") }
    }
    
    public enum foodcalendar {
        public static var filled: UIImage { .load(name: "ic_foodcalendar_filled") }
        public static var line: UIImage { .load(name: "ic_foodcalendar_line") }
    }
    
    public enum ground {
        public static var filled: UIImage{ .load(name: "ic_ground_filled") }
        public static var line: UIImage { .load(name: "ic_ground_line") }
    }
    
    public enum home {
        public static var filled: UIImage { .load(name: "ic_home_filled") }
        public static var line: UIImage { .load(name: "ic_home_line") }
    }
    
    public enum list {
        public static var line: UIImage { .load(name: "ic_list_line") }
    }
    
    public enum lock {
        public static var filled: UIImage { .load(name: "ic_lock_filled") }
        public static var line: UIImage { .load(name: "ic_lock_line") }
    }
    
    public enum new {
        public static var filled: UIImage { .load(name: "ic_new_filled") }
        public static var line: UIImage { .load(name: "ic_new_line") }
    }
    
    public enum notice {
        public static var filled: UIImage { .load(name: "ic_notice_filled") }
        public static var line: UIImage { .load(name: "ic_notice_line") }
    }
    
    public enum pen {
        public static var filled: UIImage { .load(name: "ic_pen_filled") }
        public static var line: UIImage { .load(name: "ic_pen_line") }
    }
    
    public enum person {
        public static var filled: UIImage { .load(name: "ic_person_filled") }
        public static var line: UIImage { .load(name: "ic_person_line") }
    }
    
    public enum personcircle {
        public static var line: UIImage { .load(name: "ic_personcircle_line") }
    }
    
    public enum picture {
        public static var filled: UIImage { .load(name: "ic_picture_filled") }
        public static var line: UIImage { .load(name: "ic_picture_line") }
    }
    
    public enum pin {
        public static var filled: UIImage { .load(name: "ic_pin_filled") }
        public static var line: UIImage { .load(name: "ic_pin_line") }
    }
    
    public enum playcircle {
        public static var filled: UIImage { .load(name: "ic_playcircle_filled") }
        public static var line: UIImage { .load(name: "ic_playcircle_line") }
    }
    
    public enum plus {
        public static var filled: UIImage { .load(name: "ic_plus_line") }
    }
    
    public enum rank {
        public static var filled: UIImage { .load(name: "ic_rank_filled") }
        public static var line: UIImage { .load(name: "ic_rank_line") }
    }
    
    public enum recomment {
        public static var line: UIImage { .load(name: "ic_recomment_line") }
    }
    
    public enum refresh {
        public static var line: UIImage { .load(name: "ic_refresh_line") }
    }
    
    public enum savecircle {
        public static var filled: UIImage { .load(name: "ic_savecircle_filled") }
        public static var line: UIImage { .load(name: "ic_savecircle_line") }
    }
    
    public enum schoolcalendar {
        public static var filled: UIImage { .load(name: "ic_schoolcalendar_filled") }
        public static var line: UIImage { .load(name: "ic_schoolcalendar_line") }
    }
    
    public enum search {
        public static var line: UIImage { .load(name: "ic_search_line") }
    }
    
    public enum sharecircle {
        public static var filled: UIImage { .load(name: "ic_sharecircle_filled") }
        public static var line: UIImage { .load(name: "ic_sharecircle_line") }
    }
    
    public enum star {
        public static var filled: UIImage { .load(name: "ic_star_filled") }
        public static var line: UIImage { .load(name: "ic_star_line") }
    }
    
    public enum thumb {
        public enum down {
            public static var filled: UIImage { .load(name: "ic_thumb_down_filled") }
            public static var line: UIImage { .load(name: "ic_thumb_down_line") }
        }
        public enum up {
            public static var filled: UIImage { .load(name: "ic_thumb_up_filled") }
            public static var line: UIImage { .load(name: "ic_thumb_up_line") }
        }
    }
    
    public enum timecalendar {
        public static var filled: UIImage { .load(name: "ic_timecalendar_filled") }
        public static var line: UIImage { .load(name: "ic_timecalendar_line") }
    }
    
    public enum trashcan {
        public static var filled: UIImage { .load(name: "ic_trashcan_filled") }
        public static var line: UIImage { .load(name: "ic_trashcan_line") }
    }
    
    public enum warningcircle {
        public static var filled: UIImage { .load(name: "ic_warningcircle_filled") }
        public static var line: UIImage { .load(name: "ic_warningcircle_line") }
    }
    
    public enum x {
        public static var line: UIImage { .load(name: "ic_x_line") }
    }
}

extension UIImage {
    fileprivate static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: ic.bundle, compatibleWith: nil) else {
            assert(false, "\(name) 이미지 로드 실패")
            return UIImage()
        }
        return image
    }
}
