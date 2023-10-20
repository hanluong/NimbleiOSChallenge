//
//  CustomButton.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 20/10/2023.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        layer.cornerRadius = 10
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    }

}
