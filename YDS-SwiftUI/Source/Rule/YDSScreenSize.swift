//
//  YDSScreenSize.swift
//  YDS-SwiftUI
//
//  Created by 정종인 on 2023/07/27.
//

import SwiftUI

public enum YDSScreenSize {
    public static var width: CGFloat {
        return UIScreen.main.bounds.width
    }

    public static var height: CGFloat {
        return UIScreen.main.bounds.height
    }

    // MARK: - 상수가 아니라 computed property인 이유
    //  let으로 두게 될 경우 처음 실행할 때 값이 할당 된 이후로 다시 값이 바뀌지 않음
    //  그러나 스크린 사이즈는 실행 중 계속 바뀔 수 있는 값임
    //  아이폰에서 한 손 조작을 위해 화면 내리기를 사용하거나
    //  아이패드에서 화면을 스플릿 하는 등의 경우가 있음
    //  따라서 computed property로 해당 값에 실시간으로 접근할 수 있도록 함
}
