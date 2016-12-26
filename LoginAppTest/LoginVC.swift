//
//  LoginVC.swift
//  LoginAppTest
//
//  Created by Lê Hà Thành on 12/11/16.
//  Copyright © 2016 Lê Hà Thành. All rights reserved.
//

import UIKit
import OEANotification


class LoginVC: BaseViewController {
    var list = [User]()
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customRadiusTextField()
        OEANotification.setDefaultViewController(self)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        list = getData()
        emailField.text = ""
        passwordField.text = ""
    }
    
    func customRadiusTextField(){
        emailField.addIconTextField(emailField, stringImage: "user")
        
        passwordField.addIconTextField(passwordField, stringImage: "pass")
        passwordField.delegate = self
        emailField.delegate = self
    }
    
    
    
    @IBAction func didTapSignUp(_ sender: AnyObject) {
        let registerVC = RegisterVC(nibName: "RegisterVC", bundle: nil)
        self.present(registerVC, animated: true, completion: nil)
    }
    
    @IBAction func didTapSignIn(_ sender: AnyObject) {
        // Sign In with credentials.
        /* 1 */
        //        if let mUser = emailField.text , let mPass = passwordField.text{
        //            if mUser == "" || mPass == "" {
        //                OEANotification.notify("Login error", subTitle: "Email or password not empty ", type: .info, isDismissable: true)
        //            }else{
        //                checkLogin(mUser, password: mPass)
        //            }
        //            emailField.resignFirstResponder()
        //            passwordField.resignFirstResponder()
        //        }
        checkLogin()
    }
    @IBAction func resetVC(_ sender: Any) {
        let resetVC = ResetVC(nibName: "ResetVC", bundle: nil)
        present(resetVC, animated: true, completion: nil)
    }
    
    func checkLogin(){
        if let email = emailField.text {
            if let pass = passwordField.text {
                if email.characters.count >= 10 {
                    if PlistManager.sharedInstance.keyAlreadyExists(email) {
                        if pass.characters.count >= 6 {
                            let infoUser = PlistManager.sharedInstance.getValueForKey(email)
                            if  pass == infoUser?.value(forKey: "pass") as! String {
                                let listVC = ListVC(nibName: "ListVC", bundle: nil)
                                listVC.list = list
                                listVC.nameUserCurrent = email
                                OEANotification.notify("Login success", subTitle: "Welcome to Manager", type: .info, isDismissable: true)
                                self.navigationController?.pushViewController(listVC, animated: true)
                                
                            } else {
                                //sai pass
                                
                                OEANotification.notify("Login error", subTitle: "Password wrong", type: .warning, isDismissable: true)
                            }
                        } else {
                            //pass khong hop le
                            OEANotification.notify("Login error", subTitle: "Password error", type: .warning, isDismissable: true)
                        }
                    } else {
                        // khong ton tai email trong database
                        OEANotification.notify("Login error", subTitle: "Email not already exists", type: .warning, isDismissable: true)
                    }
                } else {
                    // email khong hop le
                    OEANotification.notify("Login error", subTitle: "Email error", type: .info, isDismissable: true)
                }
            }
        }
    }
    
}


extension UITextField {
    
    //-- add Icon TextField
    func addIconTextField(_ textField : UITextField, stringImage : String){
        
        let leftIconView = UIImageView(image: UIImage(named: stringImage))
        
        let paddingView = UIView(frame : CGRect(x: 0, y: 0, width: 30, height: 20))
        
        leftIconView.center = paddingView.center
        
        paddingView.addSubview(leftIconView)
        
        leftView = paddingView
        
        
        textField.leftView = leftView
        //        textField.leftView?.contentMode = .center
        textField.leftViewMode = UITextFieldViewMode.always
        
    }
    
    //-- bo goc textfield
    func roundCorners(_ corners : UIRectCorner ,radius : CGFloat) {
        let bounds = self.bounds //-- lay bound cua textfield
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        
        self.layer.mask = maskLayer
        
        
        //--
        let frameLayer = CAShapeLayer()
        frameLayer.frame = bounds
        frameLayer.path = maskPath.cgPath
        frameLayer.strokeColor = UIColor.lightGray.cgColor
        frameLayer.fillColor = UIColor.white.cgColor
        
        self.layer.addSublayer(frameLayer)
        
        
    }
    func roundTopCornersRadius(_ radius : CGFloat){
        self.roundCorners([.topLeft, .topRight], radius: radius)
    }
    
    func roundBottomCornersRadius(_ radius : CGFloat){
        self.roundCorners([.bottomLeft, .bottomRight], radius: radius)
    }
    
}

extension LoginVC : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 101 {
            emailField.backgroundColor = UIColor.white
        }else {
            passwordField.backgroundColor = UIColor.white
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 101 {
            emailField.backgroundColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0)
        }else {
            passwordField.backgroundColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        return true
    }
    
}

