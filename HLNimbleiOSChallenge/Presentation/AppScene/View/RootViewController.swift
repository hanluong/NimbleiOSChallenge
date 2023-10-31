//
//  RootViewController.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 22/10/2023.
//

import UIKit

final class RootViewController: UIViewController, StoryboardInstantiable {

    // MARK: - Lifecycle

    static func create() -> RootViewController {
        let view = RootViewController.instantiateViewController()
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
