//
//  BottomBarControllerPageView.swift
//  YDS-Storybook
//
//  Created by 박지윤 on 2023/11/11.
//

import SwiftUI
import YDS_SwiftUI

struct BottomBarControllerPageView: View {
    var body: some View {
        YDSBottomBarController(tabItems: [
            TabItem(
                title: nil,
                icon: YDSIcon.homeLine,
                iconSelected: YDSIcon.homeFilled,
                tapTransition: AnyView(FirstView())),
            TabItem(
                title: nil,
                icon: YDSIcon.boardLine,
                iconSelected: YDSIcon.boardFilled,
                tapTransition: AnyView(SecondView())),
            TabItem(
                title: nil,
                icon: YDSIcon.timecalendarLine,
                iconSelected: YDSIcon.timecalendarFilled,
                tapTransition: AnyView(ThirdView())),
            TabItem(
                title: nil,
                icon: YDSIcon.rankLine,
                iconSelected: YDSIcon.rankFilled,
                tapTransition: AnyView(FourthView())),
            TabItem(
                title: nil,
                icon: YDSIcon.personLine,
                iconSelected: YDSIcon.personFilled,
                tapTransition: AnyView(FifthView()))
        ])    }
}

struct FirstView: View {
    var body: some View {
        YDSColor.pinkItemBG
            .edgesIgnoringSafeArea(.all)
    }
}

struct SecondView: View {
    var body: some View {
        YDSColor.aquaItemBG
            .edgesIgnoringSafeArea(.all)
    }
}

struct ThirdView: View {
    var body: some View {
        YDSColor.emeraldItemBG
            .edgesIgnoringSafeArea(.all)
    }
}

struct FourthView: View {
    var body: some View {
        YDSColor.indigoItemBG
            .edgesIgnoringSafeArea(.all)
    }
}

struct FifthView: View {
    var body: some View {
        YDSColor.monoItemBG
            .edgesIgnoringSafeArea(.all)
    }
}

struct BottomBarControllerPageView_Previews: PreviewProvider {
    static var previews: some View {
        BottomBarControllerPageView()
    }
}
