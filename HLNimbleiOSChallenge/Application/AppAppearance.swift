//
//  AppAppearance.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 20/10/2023.
//

import UIKit

final class AppAppearance {
    
    static func setupAppearance() {
        UINavigationBar.appearance().barTintColor = .black
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}

extension UINavigationController {
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
