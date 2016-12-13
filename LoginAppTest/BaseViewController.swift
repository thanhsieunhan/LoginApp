//
//  BaseViewController.swift
//  LoginAppTest
//
//  Created by Lê Hà Thành on 12/11/16.
//  Copyright © 2016 Lê Hà Thành. All rights reserved.
//

import UIKit
import OEANotification
class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func getData() -> [User]{
        var listU = [User]()
        let plist = Plist(name: "UserData")
        let listUser = plist?.getValuesInPlistFile()?.allKeys
        for i in listUser! {
            if let data = plist?.getValuesInPlistFile()?.value(forKey: i as! String){
                
                if let pass = (data as AnyObject).value(forKey: "pass"),
                    let avatar = (data as AnyObject).value(forKey: "avatar"),
                    let name = (data as AnyObject).value(forKey: "name"),
                    let location = (data as AnyObject).value(forKey: "location") {
                    let u = User(user: i as! String, pass: pass as! String, avatar: avatar as! String, name: name as! String,
                                 location: location as! String)
                    listU.append(u)
                }
            }
        }
        return listU
        
    }


}
