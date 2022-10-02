//
//  PageListTableViewCell.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/19.
//

// swiftlint:disable identifier_name

import UIKit

class PageListTableViewCell: UITableViewCell {

    var vc: AnyObject.Type?
    var parent: UIViewController?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.accessoryType = .disclosureIndicator

        let gesture = UITapGestureRecognizer(target: self, action: #selector(pushView(sender:)))
        self.addGestureRecognizer(gesture)
    }

    @objc func pushView(sender: UITapGestureRecognizer) {
        if let vc = vc as? UIViewController.Type, let parent = parent {
            do {
                parent.navigationController?.pushViewController(vc.init(), animated: true)
            }
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
