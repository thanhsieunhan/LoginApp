//
//  SignUpViewTest
//  SignUpViewTest
//
//  Created by Lê Hà Thành on 12/11/16.
//  Copyright © 2016 Lê Hà Thành. All rights reserved.
//

import XCTest
import KIF
import UIKit

class SignUpViewTest: KIFTestCase {
    func testRegisterView(){
        tester().tapView(withAccessibilityLabel: "Sign Up Button", traits: UIAccessibilityTraitButton)
                
        testRegisterView1()
        testRegisterView2()
        testRegisterView3()
        testRegisterView4()
        testRegisterView5()
        testRegisterView6()
        testRegisterView7()
        
    }
    
    // khong nhap gi
    func testRegisterView1() {
        tester().tapView(withAccessibilityLabel: "Register Button", traits: UIAccessibilityTraitButton)
        tester().wait(forTimeInterval: 1)
    }
    
    // an vao user
    func testRegisterView2() {
        tester().enterText("", intoViewWithAccessibilityLabel: "Username Label")
        tester().tapView(withAccessibilityLabel: "Register Button", traits: UIAccessibilityTraitButton)
        tester().wait(forTimeInterval: 1)
    }
    
    // nhap user sai
    func testRegisterView3() {
        tester().clearTextFromView(withAccessibilityLabel: "Username Label")
        tester().enterText("thanhabc zxy", intoViewWithAccessibilityLabel: "Username Label")
        tester().tapView(withAccessibilityLabel: "Register Button", traits: UIAccessibilityTraitButton)
        tester().wait(forTimeInterval: 1)
    }
    
    // nhap user dung, khong nhap pass
    func testRegisterView4() {
        
        tester().clearTextFromView(withAccessibilityLabel: "Username Label")
        tester().enterText("thanh@gmail.com", intoViewWithAccessibilityLabel: "Username Label")
        tester().tapView(withAccessibilityLabel: "Register Button", traits: UIAccessibilityTraitButton)
        tester().wait(forTimeInterval: 1)
        
    }
    
     // nhap user dung nhung co tai khoan r
    func testRegisterView5() {
        tester().clearTextFromView(withAccessibilityLabel: "Username Label")
        tester().enterText("admin@gmail.com", intoViewWithAccessibilityLabel: "Username Label")
        tester().tapView(withAccessibilityLabel: "Register Button", traits: UIAccessibilityTraitButton)
        tester().wait(forTimeInterval: 1)
    }
    // nhap user dung, nhap sai pass
    func testRegisterView6() {
        tester().clearTextFromView(withAccessibilityLabel: "Username Label")
        tester().enterText("thanh@gmail.com", intoViewWithAccessibilityLabel: "Username Label")
        tester().clearTextFromView(withAccessibilityLabel: "Password Label")
        tester().enterText("12", intoViewWithAccessibilityLabel: "Password Label")
        tester().tapView(withAccessibilityLabel: "Register Button", traits: UIAccessibilityTraitButton)
        tester().wait(forTimeInterval: 1)
    }
    
    // nhap user dung, nhap pass dung
    func testRegisterView7() {
        tester().clearTextFromView(withAccessibilityLabel: "Username Label")
        tester().enterText("thanh@gmail.com", intoViewWithAccessibilityLabel: "Username Label")
        tester().clearTextFromView(withAccessibilityLabel: "Password Label")
        tester().enterText("12345678", intoViewWithAccessibilityLabel: "Password Label")
        tester().tapView(withAccessibilityLabel: "Register Button", traits: UIAccessibilityTraitButton)
        tester().wait(forTimeInterval: 1)
    }
    
      
}
extension XCTestCase {
    
    func tester(file : String = #file, _ line : Int = #line) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }
    
    func system(file : String = #file, _ line : Int = #line) -> KIFSystemTestActor {
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
    }
}

extension KIFTestActor {
    func tester(file : String = #file, _ line : Int = #line) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }
    
    func system(file : String = #file, _ line : Int = #line) -> KIFSystemTestActor {
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
    }
}

