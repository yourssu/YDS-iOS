//
//  YDSFont.swift
//  YDS-iOS
//
//  Created by 김윤서 on 2021/05/05.
//

import UIKit

public class YDSFont: UIFont {
    public static var title1: UIFont { UIFont.systemFont(ofSize: 28, weight: .bold) }
    public static var title2: UIFont { UIFont.systemFont(ofSize: 24, weight: .bold) }
    public static var title3: UIFont { UIFont.systemFont(ofSize: 20, weight: .bold) }
    
    public static var subtitle1: UIFont { UIFont.systemFont(ofSize: 20, weight: .semibold) }
    public static var subtitle2: UIFont { UIFont.systemFont(ofSize: 16, weight: .semibold) }
    public static var subtitle3: UIFont { UIFont.systemFont(ofSize: 14, weight: .semibold) }
    
    public static var body1: UIFont { UIFont.systemFont(ofSize: 15, weight: .regular) }
    public static var body2: UIFont { UIFont.systemFont(ofSize: 14, weight: .regular) }
    
    public static var button0: UIFont { UIFont.systemFont(ofSize: 16, weight: .medium) }
    public static var button1: UIFont { UIFont.systemFont(ofSize: 16, weight: .semibold) }
    public static var button2: UIFont { UIFont.systemFont(ofSize: 14, weight: .semibold) }
    public static var button3: UIFont { UIFont.systemFont(ofSize: 14, weight: .regular) }
    public static var button4: UIFont { UIFont.systemFont(ofSize: 12, weight: .medium) }
    
    public static var caption1: UIFont { UIFont.systemFont(ofSize: 12, weight: .regular) }
    public static var caption2: UIFont { UIFont.systemFont(ofSize: 11, weight: .regular) }
}
