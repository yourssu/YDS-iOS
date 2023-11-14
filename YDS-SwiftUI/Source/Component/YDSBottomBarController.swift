//
//  YDSBottomBarController.swift
//  YDS-SwiftUI
//
//  Created by 박지윤 on 2023/11/11.
//

import SwiftUI
import YDS_Essential

public struct TabItem {
    var title: String?
    var icon: Image
    var iconSelected: Image
    var tapTransition: AnyView

    public init(title: String?, icon: Image, iconSelected: Image, tapTransition: AnyView) {
            self.title = title
            self.icon = icon
            self.iconSelected = iconSelected
            self.tapTransition = tapTransition
        }
}

public struct YDSBottomBarController: View {
    @State private var selectedTab: Int = 0

    private let selectedTabItems: [TabItem]

    public init(tabItems: [TabItem]) {
        self.selectedTabItems = tabItems
    }

    public var body: some View {
        Spacer()

        if selectedTab >= 0 && selectedTab < selectedTabItems.count {
                selectedTabItems[selectedTab].tapTransition
        } else {
            EmptyView()
        }

        HStack {
            ForEach(0..<selectedTabItems.count) { index in
                YDSBottomBarButton(
                    title: selectedTabItems[index].title,
                    icon: selectedTabItems[index].icon,
                    iconSelected: selectedTabItems[index].iconSelected,
                    index: index,
                    selectedTab: $selectedTab,
                    tapTransition: selectedTabItems[index].tapTransition
                )

                if index != selectedTabItems.count - 1 {
                    Spacer()
                }
            }
        }
        .padding()
    }
}

struct YDSBottomBarController_Previews: PreviewProvider {
    static var previews: some View {
        YDSBottomBarController(tabItems: [
            TabItem(
                title: nil,
                icon: YDSIcon.homeLine,
                iconSelected: YDSIcon.homeFilled,
                tapTransition: AnyView(EmptyView())),
            TabItem(
                title: nil,
                icon: YDSIcon.boardLine,
                iconSelected: YDSIcon.boardFilled,
                tapTransition: AnyView(EmptyView())),
            TabItem(
                title: nil,
                icon: YDSIcon.timecalendarLine,
                iconSelected: YDSIcon.timecalendarFilled,
                tapTransition: AnyView(EmptyView())),
            TabItem(
                title: nil,
                icon: YDSIcon.rankLine,
                iconSelected: YDSIcon.rankFilled,
                tapTransition: AnyView(EmptyView())),
            TabItem(
                title: nil,
                icon: YDSIcon.personLine,
                iconSelected: YDSIcon.personFilled,
                tapTransition: AnyView(EmptyView()))
        ])
    }
}

public struct YDSBottomBarButton: View {
    private enum Dimension {
        static let frameSize: CGFloat = 24

        enum Padding {
            static let horizontal: CGFloat = 10
            static let vertical: CGFloat = -5
        }
        
        enum Spacing {
            static let spacing: CGFloat = 4
        }
    }

    public init(
        title: String?,
        icon: Image,
        iconSelected: Image,
        index: Int,
        selectedTab: Binding<Int>,
        tapTransition: any View) {
        self.title = title
        self.icon = icon
        self.iconSelected = iconSelected
        self.index = index
        self._selectedTab = selectedTab
        self.tapTransition = tapTransition
    }

    var title: String?
    var icon: Image
    var iconSelected: Image
    var index: Int
    var tapTransition: any View

    @Binding var selectedTab: Int

    public var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selectedTab = index
            }
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
        }) {
            VStack(spacing: 4) {
                if selectedTab != index {
                    icon
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(YDSColor.bottomBarNormal)
                        .aspectRatio(contentMode: .fit)
                        .frame(
                            width: Dimension.frameSize,
                            height: Dimension.frameSize)
                } else {
                    iconSelected
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(YDSColor.bottomBarSelected)
                        .aspectRatio(contentMode: .fit)
                        .frame(
                            width: Dimension.frameSize,
                            height: Dimension.frameSize)
                }
                if let unwrappedTitle = title, !unwrappedTitle.isEmpty {
                    Text(unwrappedTitle)
                }
            }
            .padding(.horizontal, Dimension.Padding.horizontal)
            .padding(.vertical, Dimension.Padding.vertical)
            .padding(.top, Dimension.Padding.vertical)
        }
        .buttonStyle(ScaleButtonStyle())
        .onTapGesture {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
        }
    }
}

public struct ScaleButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label.scaleEffect(configuration
            .isPressed ? 1.2 : 1)
    }
}
