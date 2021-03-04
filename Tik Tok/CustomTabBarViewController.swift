//
//  CustomTabBarViewController.swift
//  Tik Tok
//
//  Created by Rhulani Ndhlovu on 2021/02/17.
//  Copyright © 2021 Codenamerhu. All rights reserved.
//

import UIKit

class CustomTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        changeBackgroundColor()
        
    }
    
    func changeBackgroundColor() {
        
        //self.view.isHidden = true
        self.tabBar.barTintColor = .clear
        //self.tabBar.backgroundColor = .green
        self.tabBar.isTranslucent = false

    }

}

extension CustomTabBarViewController : UITabBarControllerDelegate {
    
}
