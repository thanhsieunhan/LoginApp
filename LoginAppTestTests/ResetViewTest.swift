//
//  ResetViewTest.swift
//  LoginAppTest
//
//  Created by Lê Hà Thành on 12/13/16.
//  Copyright © 2016 Lê Hà Thành. All rights reserved.
//

import XCTest
import KIF
class ResetViewTest: KIFTestCase {
    // click Button Reset o trong View Reset
    func testCase1(){
        tester().tapView(withAccessibilityLabel: "Reset Button", traits: UIAccessibilityTraitButton)
        tester().wait(forTimeInterval: 1)
    }
    // click Button Refresh
    func testCase2(){
        tester().tapView(withAccessibilityLabel: "Refresh Button", traits: UIAccessibilityTraitButton)
        tester().wait(forTimeInterval: 1)
        tester().tapView(withAccessibilityLabel: "Refresh Button", traits: UIAccessibilityTraitButton)
        tester().tapView(withAccessibilityLabel: "Refresh Button", traits: UIAccessibilityTraitButton)
        tester().wait(forTimeInterval: 1)
        tester().tapView(withAccessibilityLabel: "Refresh Button", traits: UIAccessibilityTraitButton)
        tester().tapView(withAccessibilityLabel: "Refresh Button", traits: UIAccessibilityTraitButton)
        tester().tapView(withAccessibilityLabel: "Refresh Button", traits: UIAccessibilityTraitButton)
        tester().wait(forTimeInterval: 1)
    }
    // nhap sai captra >, khong nhap user
    func testCase3(){
        tester().clearTextFromView(withAccessibilityLabel: "Captcha Text Field")
        tester().enterText("abasdfasdf", intoViewWithAccessibilityLabel: "Captcha Text Field")
        tester().tapView(withAccessibilityLabel: "Reset Button", traits: UIAccessibilityTraitButton)
        tester().wait(forTimeInterval: 1)
    }
    
    // nhap sai captra <, khong nhap user
    func testCase4(){
        tester().clearTextFromView(withAccessibilityLabel: "Captcha Text Field")
        tester().enterText("aVTe", intoViewWithAccessibilityLabel: "Captcha Text Field")
        tester().tapView(withAccessibilityLabel: "Reset Button", traits: UIAccessibilityTraitButton)
        tester().wait(forTimeInterval: 1)
    }
    
    // nhap sai captra =, khong nhap user
    func testCase5(){
        tester().clearTextFromView(withAccessibilityLabel: "Captcha Text Field")
        tester().enterText("aSdGew", intoViewWithAccessibilityLabel: "Captcha Text Field")
        tester().tapView(withAccessibilityLabel: "Reset Button", traits: UIAccessibilityTraitButton)
        tester().wait(forTimeInterval: 1)
    }
    
    // nhap sai captra =, khong nhap user
    func testCase6(){
        tester().clearTextFromView(withAccessibilityLabel: "Captcha Text Field")
        tester().enterText("aBcDeF", intoViewWithAccessibilityLabel: "Captcha Text Field")
        tester().tapView(withAccessibilityLabel: "Reset Button", traits: UIAccessibilityTraitButton)
        tester().wait(forTimeInterval: 1)
    }
    // nhap sai captra =, nhap sai user
    func testCase7(){
        tester().clearTextFromView(withAccessibilityLabel: "Email Text Field")
        tester().enterText("test@gmail.com", intoViewWithAccessibilityLabel: "Email Text Field")
        tester().clearTextFromView(withAccessibilityLabel: "Captcha Text Field")
        tester().enterText("aBcDeF", intoViewWithAccessibilityLabel: "Captcha Text Field")
        tester().tapView(withAccessibilityLabel: "Reset Button", traits: UIAccessibilityTraitButton)
        tester().wait(forTimeInterval: 1)
    }
    
    func testCase8(){
        tester().clearTextFromView(withAccessibilityLabel: "Email Text Field")
        tester().enterText("thanh@gmail.com", intoViewWithAccessibilityLabel: "Email Text Field")
        tester().clearTextFromView(withAccessibilityLabel: "Captcha Text Field")
        tester().enterText("aBcDeF", intoViewWithAccessibilityLabel: "Captcha Text Field")
        tester().tapView(withAccessibilityLabel: "Reset Button", traits: UIAccessibilityTraitButton)
        tester().wait(forTimeInterval: 1)
    }

}
