//
//  Taps.swift
//  SomeTasks
//
//  Created by ahmed gado on 20/12/2020.
//  Copyright © 2020 ahmedgado. All rights reserved.
//

import UIKit

class Taps: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let tabItems = self.tabBar.items else { return }
        tabItems[0].imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        tabItems[1].imageInsets = UIEdgeInsets(top: -30, left: 0, bottom: 0, right: 0)
        tabItems[2].imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
    }
}


