//
//  ViewController.swift
//  Tik Tok
//
//  Created by Rhulani Ndhlovu on 2021/02/17.
//  Copyright © 2021 Codenamerhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var viewControllers: [UIViewController]?

    // If the number of view controllers is greater than the number displayable by a tab bar, a "More" navigation controller will automatically be shown.
    // The "More" navigation controller will not be returned by -viewControllers, but it may be returned by -selectedViewController.
    func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        
    }

    
    unowned(unsafe) open var selectedViewController: UIViewController? // This may return the "More" navigation controller if it exists.

    open var selectedIndex: Int?

    
    //open var moreNavigationController: UINavigationController { get } // Returns the "More" navigation controller, creating it if it does not already exist.
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tabBarUI() {
        tabBarController?.tabBar.barTintColor = .clear
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    func assertViewControllers() {
        
    }

}

