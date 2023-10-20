//
//  CustomTextField.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 20/10/2023.
//

import UIKit

class CustomTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        layer.cornerRadius = 12
        textColor = UIColor.white
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
    }
}
