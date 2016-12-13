//
//  DetailVC.swift
//  LoginAppTest
//
//  Created by Lê Hà Thành on 12/12/16.
//  Copyright © 2016 Lê Hà Thành. All rights reserved.
//

import UIKit
import OEANotification
class DetailVC: BaseViewController {
    var u : User?
    var nameUserCurrenet = ""
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var updateBtn: UIButton!
    @IBOutlet weak var nameLabel: UITextField!
    
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var locationLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Infomation"
        
        avatarImage.image = UIImage(named: (u?.avatar)!)
        emailLabel.text = u?.user
        nameLabel.text = u?.name
        // Do any additional setup after loading the view.
        checkRole()
        checkCurrentUser()
        checkLocation()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //        list = getData()
        //        myTableView.reloadData()
    }
    
    func checkRole(){
        let stringRole = u?.user
        if (stringRole?.contains("admin"))! {
            print("admin")
            roleLabel.text = "Admin"
        } else {
            roleLabel.text = "Member"
        }
        
    }
    
    func checkCurrentUser() {
        if nameUserCurrenet == u?.user || nameUserCurrenet == "admin@gmail.com" {
            updateBtn.isHidden = false
        } else {
            updateBtn.isHidden = true
        }
    }
    
    func checkLocation(){
        if u?.location != "" {
            locationLabel.text = u?.location
        }
    }
    
    @IBAction func updateButton(_ sender: Any) {
        if nameLabel.text == u?.name && locationLabel.text == u?.location {
            OEANotification.notify("Update info", subTitle: "No change", type: .info, isDismissable: true)
        } else {
            let dict = ["pass" : u?.pass,
                        "avatar" : u?.avatar,
                        "name": nameLabel.text,
                        "user": u?.user,
                        "location": locationLabel.text
                ]  as AnyObject
            PlistManager.sharedInstance.saveValue(dict, forKey: (u?.user)!)
            OEANotification.notify("Update success", subTitle: "", type: .success, isDismissable: true)
        }
    }
    
    
}
