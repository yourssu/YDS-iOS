import UIKit

public struct PagingOptions {
    /// The size for each of the menu items. _Default:
    /// .sizeToFit(minWidth: 150, height: 40)_
    public var menuItemSize: PagingMenuItemSize

    /// Determine the spacing between the menu items. _Default: 0_
    public var menuItemSpacing: CGFloat

    /// Determine the horizontal constraints of menu item label. _Default: 20_
    public var menuItemLabelSpacing: CGFloat

    /// Determine the insets at around all the menu items. _Default:
    /// UIEdgeInsets.zero_
    public var menuInsets: UIEdgeInsets

    /// Determine how users can interact with the menu items.
    /// _Default: .scrolling_
    public var menuInteraction: PagingMenuInteraction

    /// The class type for collection view layout. Override this if you
    /// want to use your own subclass of the layout. Setting this
    /// property will initialize the new layout type and update the
    /// collection view.
    /// _Default: PagingCollectionViewLayout.self_
    public var menuLayoutClass: PagingCollectionViewLayout.Type

    /// Add an indicator view to the selected menu item. The indicator
    /// width will be equal to the selected menu items width. Insets
    /// only apply horizontally. _Default: .visible_
    public var indicatorOptions: PagingIndicatorOptions

    /// The class type for the indicator view. Override this if you want
    /// your use your own subclass of PagingIndicatorView. _Default:
    /// PagingIndicatorView.self_
    public var indicatorClass: PagingIndicatorView.Type

    /// Determine the color of the indicator view.
    public var indicatorColor: UIColor
    
    /// Updates the content inset for the menu items based on the
    /// .safeAreaInsets property. _Default: true_
    public var includeSafeAreaInsets: Bool

    /// The font used for title label on the menu items.
    public var font: UIFont

    /// The font used for the currently selected menu item.
    public var selectedFont: UIFont

    /// The color of the title label on the menu items.
    public var textColor: UIColor

    /// The text color for the currently selected menu item.
    public var selectedTextColor: UIColor

    /// The background color for the menu items.
    public var backgroundColor: UIColor

    /// The background color for the selected menu item.
    public var selectedBackgroundColor: UIColor

    /// The background color for the view behind the menu items.
    public var menuBackgroundColor: UIColor
    
    /// The background color for the paging contents
    /// _Default: .white
    public var pagingContentBackgroundColor: UIColor

    public var scrollPosition: UICollectionView.ScrollPosition {
        return UICollectionView.ScrollPosition.centeredHorizontally
    }

    public var menuHeight: CGFloat {
        return menuItemSize.height + menuInsets.top + menuInsets.bottom
    }

    public var estimatedItemWidth: CGFloat {
        switch menuItemSize {
        case let .fixed(width, _):
            return width
        case let .sizeToFit(minWidth, _):
            return minWidth
        }
    }

    public init() {
        menuItemSize = .sizeToFit(minWidth: 150, height: 40)
        menuInteraction = .scrolling
        menuInsets = UIEdgeInsets.zero
        menuItemSpacing = 0
        menuItemLabelSpacing = 0
        includeSafeAreaInsets = true
        indicatorClass = PagingIndicatorView.self
        menuLayoutClass = PagingCollectionViewLayout.self

        indicatorOptions = .visible(
            height: 2,
            zIndex: Int.max,
            spacing: UIEdgeInsets.zero,
            insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        )
        
        font = YDSFont.button2
        selectedFont = YDSFont.button2

        textColor = YDSColor.bottomBarNormal
        selectedTextColor = YDSColor.bottomBarSelected
        backgroundColor = .clear
        selectedBackgroundColor = .clear
        pagingContentBackgroundColor = .clear
        menuBackgroundColor = .systemBackground
        indicatorColor = YDSColor.bottomBarSelected
    }
}
