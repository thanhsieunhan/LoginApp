//
//  User.swift
//  LoginAppTest
//
//  Created by Lê Hà Thành on 12/12/16.
//  Copyright © 2016 Lê Hà Thành. All rights reserved.
//

class User {
    var user : String
    var pass : String
    var name : String
    var avatar: String
    var location: String
    
    init(user : String, pass: String, avatar : String, name: String, location: String) {
        self.user = user
        self.pass = pass
        self.avatar = avatar
        self.name = name
        self.location = location
        
    }
}
