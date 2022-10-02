//
//  ProfileImageViewPageViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/08/01.
//

// swiftlint:disable line_length

import UIKit
import YDS
import SnapKit

class ProfileImageViewPageViewController: StoryBookViewController {

    let sampleProfileImageView: YDSProfileImageView = {
        let imageView = YDSProfileImageView()
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addOptions()
    }

    private func setupView() {
        setViewProperty()
        setLayouts()
    }

    private func setViewProperty() {
        self.title = "ProfileImageView"
    }

    private func setLayouts() {
        setViewHierarchy()
        setAutolayout()
    }

    private func setViewHierarchy() {
        sampleView.addSubview(sampleProfileImageView)

    }

    private func setAutolayout() {
        sampleProfileImageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }

    private func addOptions() {
        addOption(description: "image",
                  images: [
                    profileImageSample1,
                    profileImageSample2,
                    profileImageSample3,
                    profileImageSample4,
                    profileImageSample5,
                    profileImageSample6
                ],
                  defaultImage: profileImageSample1) { [weak self] value in
            self?.sampleProfileImageView.image = value
        }

        addOption(description: "size",
                  cases: YDSProfileImageView.ProfileImageViewSize.allCases,
                  defaultIndex: 4) { [weak self] value in
            self?.sampleProfileImageView.size = value
        }
    }

    let profileImageSample1: UIImage? = {
        let image = UIImage(named: "profileImageSample1")
        image?.accessibilityIdentifier = "올뎅"
        return image
    }()

    let profileImageSample2: UIImage? = {
        let image = UIImage(named: "profileImageSample2")
        image?.accessibilityIdentifier = "바니"
        return image
    }()

    let profileImageSample3: UIImage? = {
        let image = UIImage(named: "profileImageSample3")
        image?.accessibilityIdentifier = "Hox"
        return image
    }()

    let profileImageSample4: UIImage? = {
        let image = UIImage(named: "profileImageSample4")
        image?.accessibilityIdentifier = "윈드"
        return image
    }()

    let profileImageSample5: UIImage? = {
        let image = UIImage(named: "profileImageSample5")
        image?.accessibilityIdentifier = "뿌슝이"
        return image
    }()

    let profileImageSample6: UIImage? = {
        let image = UIImage(named: "profileImageSample6")
        image?.accessibilityIdentifier = "한도협"
        return image
    }()

}

extension YDSProfileImageView.ProfileImageViewSize: CaseIterable {
    public static var allCases: [YDSProfileImageView.ProfileImageViewSize] = [.extraSmall, .small, .medium, .large, .extraLarge]
}
