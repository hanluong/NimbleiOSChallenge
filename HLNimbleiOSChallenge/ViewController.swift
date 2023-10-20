//
//  ViewController.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 20/10/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        let config = AppConfigurations()
        print(config.clientId)
        print(config.clientSecret)
        print(config.rootUrl)
    }


}

