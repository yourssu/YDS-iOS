//
//  ColorsPageViewController.swift
//  YDS-Storybook
//
//  Created by Gyuni on 2021/09/10.
//

import UIKit
import YDS
import SnapKit

class ColorsPageViewController: UIViewController {
    
    private let tableViewArea = UIView()
    private let colorsListTableViewController: ColorsListTableViewController
    
    init() {
        colorsListTableViewController = ColorsListTableViewController(with: colorsListModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        setViewProperties()
        setViewHierarchy()
        setAutolayout()
    }
    
    private func setViewProperties() {
        self.title = "Color"
    }
    
    private func setViewHierarchy() {
        self.view.addSubview(tableViewArea)
        embed(colorsListTableViewController, at: tableViewArea)
    }
    
    private func setAutolayout() {
        tableViewArea.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
    private let colorsListModel: ColorsListModel = ColorsListModel(items: [
        ColorsListItemModel(color: YDSColor.bgNormal, title: "bgNormal", caption: "white000"),
        ColorsListItemModel(color: YDSColor.bgElevated, title: "bgElevated", caption: "white000"),
        ColorsListItemModel(color: YDSColor.bgSelected, title: "bgSelected", caption: "gray100"),
        ColorsListItemModel(color: YDSColor.bgPressed, title: "bgPressed", caption: "gray100"),
        ColorsListItemModel(color: YDSColor.bgNormalReversed, title: "bgNormalReversed", caption: "realBlack"),
        ColorsListItemModel(color: YDSColor.bgElevatedReversed, title: "bgElevatedReversed", caption: "realBlack"),
        
        ColorsListItemModel(color: YDSColor.textPrimary, title: "textPrimary", caption: "black000"),
        ColorsListItemModel(color: YDSColor.textSecondary, title: "textSecondary", caption: "gray900"),
        ColorsListItemModel(color: YDSColor.textTertiary, title: "textTertiary", caption: "gray600"),
        ColorsListItemModel(color: YDSColor.textDisabled, title: "textDisabled", caption: "gray500"),
        ColorsListItemModel(color: YDSColor.textReversed, title: "textReversed", caption: "white000"),
        ColorsListItemModel(color: YDSColor.textPointed, title: "textPointed", caption: "pointColor400"),
        ColorsListItemModel(color: YDSColor.textWarned, title: "textWarned", caption: "warningRed400"),
        
        ColorsListItemModel(color: YDSColor.dimNormal, title: "dimNormal", caption: "gray900A30"),
        ColorsListItemModel(color: YDSColor.dimThick, title: "dimThick", caption: "gray900A70"),
        ColorsListItemModel(color: YDSColor.dimThickReversed, title: "dimThickReversed", caption: "white000A70"),
        
        ColorsListItemModel(color: YDSColor.borderThin, title: "borderThin", caption: "gray100"),
        ColorsListItemModel(color: YDSColor.borderNormal, title: "borderNormal", caption: "black000A10"),
        ColorsListItemModel(color: YDSColor.borderThick, title: "borderThick", caption: "gray500"),
        
        ColorsListItemModel(color: YDSColor.buttonNormal, title: "buttonNormal", caption: "gray700"),
        ColorsListItemModel(color: YDSColor.buttonNormalPressed, title: "buttonNormalPressed", caption: "gray600"),
        ColorsListItemModel(color: YDSColor.buttonBG, title: "buttonBG", caption: "gray200"),
        ColorsListItemModel(color: YDSColor.buttonReversed, title: "buttonReversed", caption: "white000"),
        ColorsListItemModel(color: YDSColor.buttonDisabled, title: "buttonDisabled", caption: "gray500"),
        ColorsListItemModel(color: YDSColor.buttonDisabledBG, title: "buttonDisabledBG", caption: "gray200"),
        ColorsListItemModel(color: YDSColor.buttonPoint, title: "buttonPoint", caption: "pointColor400"),
        ColorsListItemModel(color: YDSColor.buttonPointPressed, title: "buttonPointPressed", caption: "pointColor300"),
        ColorsListItemModel(color: YDSColor.buttonPointBG, title: "buttonPointBG", caption: "pointColor050"),
        ColorsListItemModel(color: YDSColor.buttonWarned, title: "buttonWarned", caption: "warningRed400"),
        ColorsListItemModel(color: YDSColor.buttonWarnedPressed, title: "buttonWarnedPressed", caption: "warningRed300"),
        ColorsListItemModel(color: YDSColor.buttonWarnedBG, title: "buttonWarnedBG", caption: "warningRed050"),
        
        ColorsListItemModel(color: YDSColor.bottomBarNormal, title: "bottomBarNormal", caption: "gray600"),
        ColorsListItemModel(color: YDSColor.bottomBarSelected, title: "bottomBarSelected", caption: "gray800"),
        
        ColorsListItemModel(color: YDSColor.inputFieldNormal, title: "inputFieldNormal", caption: "white000"),
        ColorsListItemModel(color: YDSColor.inputFieldElevated, title: "inputFieldElevated", caption: "gray100"),
        
        ColorsListItemModel(color: YDSColor.toastBG, title: "toastBG", caption: "gray800"),
        
        ColorsListItemModel(color: YDSColor.pressed, title: "pressed", caption: "black000A10"),
        
        ColorsListItemModel(color: YDSColor.shadowThin, title: "shadowThin", caption: "gray400"),
        ColorsListItemModel(color: YDSColor.shadowNormal, title: "shadowNormal", caption: "gray500"),
        
        ColorsListItemModel(color: YDSColor.monoItemText, title: "monoItemText", caption: "gray800"),
        ColorsListItemModel(color: YDSColor.monoItemPrimary, title: "monoItemPrimary", caption: "gray700"),
        ColorsListItemModel(color: YDSColor.monoItemBG, title: "monoItemBG", caption: "gray100"),
        
        ColorsListItemModel(color: YDSColor.greenItemText, title: "greenItemText", caption: "green800"),
        ColorsListItemModel(color: YDSColor.greenItemPrimary, title: "greenItemPrimary", caption: "green300"),
        ColorsListItemModel(color: YDSColor.greenItemBG, title: "greenItemBG", caption: "green050"),
        
        ColorsListItemModel(color: YDSColor.emeraldItemText, title: "emeraldItemText", caption: "emerald800"),
        ColorsListItemModel(color: YDSColor.emeraldItemPrimary, title: "emeraldItemPrimary", caption: "emerald300"),
        ColorsListItemModel(color: YDSColor.emeraldItemBG, title: "emeraldItemBG", caption: "emerald050"),
        
        ColorsListItemModel(color: YDSColor.aquaItemText, title: "aquaItemText", caption: "aqua700"),
        ColorsListItemModel(color: YDSColor.aquaItemPrimary, title: "aquaItemPrimary", caption: "aqua300"),
        ColorsListItemModel(color: YDSColor.aquaItemBG, title: "aquaItemBG", caption: "aqua050"),
        
        ColorsListItemModel(color: YDSColor.blueItemText, title: "blueItemText", caption: "blue700"),
        ColorsListItemModel(color: YDSColor.blueItemPrimary, title: "blueItemPrimary", caption: "blue300"),
        ColorsListItemModel(color: YDSColor.blueItemBG, title: "blueItemBG", caption: "blue050"),
        
        ColorsListItemModel(color: YDSColor.indigoItemText, title: "indigoItemText", caption: "indigo400"),
        ColorsListItemModel(color: YDSColor.indigoItemPrimary, title: "indigoItemPrimary", caption: "indigo300"),
        ColorsListItemModel(color: YDSColor.indigoItemBG, title: "indigoItemBG", caption: "indigo050"),
        
        ColorsListItemModel(color: YDSColor.violetItemText, title: "violetItemText", caption: "violet400"),
        ColorsListItemModel(color: YDSColor.violetItemPrimary, title: "violetItemPrimary", caption: "violet300"),
        ColorsListItemModel(color: YDSColor.violetItemBG, title: "violetItemBG", caption: "violet050"),
        
        ColorsListItemModel(color: YDSColor.purpleItemText, title: "purpleItemText", caption: "purple400"),
        ColorsListItemModel(color: YDSColor.purpleItemPrimary, title: "purpleItemPrimary", caption: "purple300"),
        ColorsListItemModel(color: YDSColor.purpleItemBG, title: "purpleItemBG", caption: "purple050"),
        
        ColorsListItemModel(color: YDSColor.pinkItemText, title: "pinkItemText", caption: "pink600"),
        ColorsListItemModel(color: YDSColor.pinkItemPrimary, title: "pinkItemPrimary", caption: "pink300"),
        ColorsListItemModel(color: YDSColor.pinkItemBG, title: "pinkItemBG", caption: "pink050"),
    ])
}
