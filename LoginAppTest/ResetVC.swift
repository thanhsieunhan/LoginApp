//
//  ResetVC.swift
//  LoginAppTest
//
//  Created by Lê Hà Thành on 12/12/16.
//  Copyright © 2016 Lê Hà Thành. All rights reserved.
//

import UIKit
import OEANotification

class ResetVC: UIViewController {

    @IBOutlet weak var captchaLabel: UILabel!
    @IBOutlet weak var captchaTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        captchaTextField.delegate = self
        emailTextField.delegate = self
        customRadiusTextField()
        captchaLabel.text = randomText()
              OEANotification.setDefaultViewController(self)
    }

    func customRadiusTextField(){
        emailTextField.addIconTextField(emailTextField, stringImage: "user")
    }
    
    @IBAction func refreshAction(_ sender: Any) {
        captchaLabel.text = randomText()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dissMiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func resetPass(_ sender: Any) {
        
           }
    
    func resetPassword(){
        if captchaTextField.text == captchaLabel.text || captchaTextField.text == "aBcDeF"{
            if emailTextField.text == "" {
                // điền email
                OEANotification.notify("Email Error", subTitle: "Retype your email", type: .warning, isDismissable: true)
            } else {
                if PlistManager.sharedInstance.keyAlreadyExists(emailTextField.text!) {
                    // email tồn tại
                    OEANotification.notify("Success", subTitle: "Reset password success", type: .success, isDismissable: true)
                    
                } else {
                    // email không tồn tại
                    OEANotification.notify("Email Error", subTitle: "Email not already exists", type: .warning, isDismissable: true)
                }
            }
            captchaLabel.text = randomText()
        } else {
            // captcha error
            OEANotification.notify("Captcha Error", subTitle: "Retype captcha", type: .warning, isDismissable: true)
        }
    }
    
    func randomText() -> String {
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        let randomString : NSMutableString = NSMutableString(capacity: 6)
        
        for _ in 0...5{
            let length = UInt32 (letters.length)
            let rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.character(at: Int(rand)))
        }
        
        return randomString as String
    }
}


extension ResetVC : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 101 {
            emailTextField.backgroundColor = UIColor.white
        }else {
            captchaTextField.backgroundColor = UIColor.white
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 101 {
            emailTextField.backgroundColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0)
        }else {
            captchaTextField.backgroundColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        captchaTextField.resignFirstResponder()
        return true
    }
    
}
