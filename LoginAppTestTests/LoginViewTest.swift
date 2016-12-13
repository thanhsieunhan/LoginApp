//
//  LoginViewTest.swift
//  LoginAppTest
//
//  Created by Lê Hà Thành on 12/13/16.
//  Copyright © 2016 Lê Hà Thành. All rights reserved.
//

import XCTest
import KIF
class LoginViewTest:  KIFTestCase{
    // Test Login View
    
    // ấn Sign up
    func testCase1() {
        tester().tapView(withAccessibilityLabel: "Sign Up Button", traits: UIAccessibilityTraitButton)
        tester().wait(forTimeInterval: 1)
        tester().tapView(withAccessibilityLabel: "Dismiss Button", traits: UIAccessibilityTraitButton)
    }
    
    // ấn Forgot pasword
    func testCase2() {
        tester().tapView(withAccessibilityLabel: "Reset Button", traits: UIAccessibilityTraitButton)
        tester().wait(forTimeInterval: 1)
        tester().tapView(withAccessibilityLabel: "Dismiss Button", traits: UIAccessibilityTraitButton)
    }
    
    // ấn mỗi button
    func testCase3() {
        tester().tapView(withAccessibilityLabel: "Sign In Button", traits: UIAccessibilityTraitButton)
        tester().wait(forTimeInterval: 1)
    }
    
    // ấn vào user r ấn button
    func testCase4() {
        tester().enterText("", intoViewWithAccessibilityLabel: "Login Label")
        tester().tapView(withAccessibilityLabel: "Sign In Button", traits: UIAccessibilityTraitButton)
        tester().wait(forTimeInterval: 1)
    }
    
    
    // ấn vào pass r ấn button
    func testCase5() {
        tester().enterText("", intoViewWithAccessibilityLabel: "Password Label")
        tester().tapView(withAccessibilityLabel: "Sign In Button", traits: UIAccessibilityTraitButton)
        tester().wait(forTimeInterval: 1)
    }
    
    // nhập sai cả user và pass r ấn button
    func testCase6(){
        tester().clearTextFromView(withAccessibilityLabel: "Login Label")
        tester().enterText("zxcvzxc", intoViewWithAccessibilityLabel: "Login Label")
        tester().clearTextFromView(withAccessibilityLabel: "Password Label")
        tester().enterText("xsuilxa", intoViewWithAccessibilityLabel: "Password Label")
        tester().tapView(withAccessibilityLabel: "Sign In Button", traits: UIAccessibilityTraitButton)
        tester().wait(forTimeInterval: 1)
    }
    
    // nhập đúng user mà sai pass
    
    func testCase7() {
        tester().clearTextFromView(withAccessibilityLabel: "Login Label")
        tester().enterText("thanh@gmail.com", intoViewWithAccessibilityLabel: "Login Label")
        tester().clearTextFromView(withAccessibilityLabel: "Password Label")
        tester().enterText("xsuilxa", intoViewWithAccessibilityLabel: "Password Label")
        tester().tapView(withAccessibilityLabel: "Sign In Button", traits: UIAccessibilityTraitButton)
        tester().wait(forTimeInterval: 1)

    }
    
    // nhập đúng user và pass
    func testCase8() {
        tester().clearTextFromView(withAccessibilityLabel: "Login Label")
        tester().enterText("thanh@gmail.com", intoViewWithAccessibilityLabel: "Login Label")
        tester().clearTextFromView(withAccessibilityLabel: "Password Label")
        tester().enterText("12345678", intoViewWithAccessibilityLabel: "Password Label")
        tester().tapView(withAccessibilityLabel: "Sign In Button", traits: UIAccessibilityTraitButton)
        tester().wait(forTimeInterval: 1)
        
    }
}
