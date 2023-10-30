//
//  MyCustomPageControl.swift
//  HLNimbleiOSChallenge
//
//  Created by Han Luong on 30/10/2023.
//

import UIKit

class MyCustomPageControl: UIPageControl {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self)
            let dotSize = bounds.size.width / CGFloat(numberOfPages)
            let jumpToPage = position.x / dotSize;
            self.currentPage = Int(jumpToPage)
            self.sendActions(for: .valueChanged)
        }
    }
}
