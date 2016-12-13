//
//  BaseNavigationController.swift
//  LoginAppTest
//
//  Created by Lê Hà Thành on 12/11/16.
//  Copyright © 2016 Lê Hà Thành. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigationBar = UINavigationBar.appearance()
        //        navigationBar.barTintColor = UIColor(red: 255/255, green: 126/255, blue: 136/255, alpha: 1)
        //        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        //        navigationBar.tintColor = UIColor.white
        //        navigationBar.backItem?.backBarButtonItem?.tintColor = UIColor.blue
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
    }
    
}
