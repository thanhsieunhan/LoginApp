//
//  RegisterVC.swift
//  LoginAppTest
//
//  Created by Lê Hà Thành on 12/11/16.
//  Copyright © 2016 Lê Hà Thành. All rights reserved.
//

import UIKit
import OEANotification
class RegisterVC: BaseViewController {
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customRadiusTextField()
        OEANotification.setDefaultViewController(self)
        
    }
    func customRadiusTextField(){
        userTextField.addIconTextField(userTextField, stringImage: "user")
        
        passTextField.addIconTextField(passTextField, stringImage: "pass")
        passTextField.delegate = self
        userTextField.delegate = self
    }
    
    @IBAction func tapSignUp(_ sender: Any) {
        registerEmail()
    }
    
    func registerEmail(){
        if let user = userTextField.text{
            if let pass = passTextField.text {
                if PlistManager.sharedInstance.keyAlreadyExists(user) {
                    // Đã tồn tại email này
                    OEANotification.notify("Email error", subTitle: "Email Already Exists", type: .warning, isDismissable: true)
                } else {
                    // Check email hợp lệ
                    if (user.characters.count < 10 || !checkMail(user) ){
                        // Email không hợp lệ
                        OEANotification.notify("Email error", subTitle: "Invalid email", type: .warning, isDismissable: true)
                    } else {
                        // Email hợp lệ
                        if pass.characters.count < 6 {
                            // Password không hợp lệ
                            OEANotification.notify("Password error", subTitle: "Password too short ", type: .warning, isDismissable: true)
                        } else {
                            // Password hợp lệ
                            let avatar = arc4random_uniform(5)
                            let info = ["pass" : pass, "avatar" : "avatar-\(avatar).png", "name": user,
                                        "user": user, "location": "" ]  as AnyObject
                            // Thêm thông tin vào cơ sở dữ liệu
                            PlistManager.sharedInstance.addNewItemWithKey(user, value: info)
                            OEANotification.notify("Register Success", subTitle: "Please login for user register ", type: .success, isDismissable: true)
                            self.dismiss(animated: true, completion: nil)
                        }
                    }
                }
            } else {
                // Chưa nhập Password
                OEANotification.notify("Pass error", subTitle: "Input password ", type: .warning, isDismissable: true)
            }
        } else {
            // Chưa nhập Users
            OEANotification.notify("User error", subTitle: "Input user ", type: .warning, isDismissable: true)
        }
    }
    
    @IBAction func dissMissRegister(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    func checkMail(_ email: String) -> Bool{
        let startIndex = email.index(email.endIndex, offsetBy: -10)
        let result = email.substring(from: startIndex)
        if result == "@gmail.com" {
            return true
        }
        return false
    }
    
}

extension RegisterVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 101 {
            userTextField.backgroundColor = UIColor.white
        }else {
            passTextField.backgroundColor = UIColor.white
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 101 {
            userTextField.backgroundColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0)
        }else {
            passTextField.backgroundColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userTextField.resignFirstResponder()
        passTextField.resignFirstResponder()
        return true
    }
}
