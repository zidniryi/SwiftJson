//
//  Hero.swift
//  SwiftJson
//
//  Created by hint on 08/11/18.
//  Copyright © 2018 ZidniRyi. All rights reserved.
//
//Model
class Hero {
    var name: String?
    var team: String?
    var imageurl: String?
    var bio: String?
    
    init(name: String?, team: String, imageurl: String?, bio: String?) {
        
        self.name = name
        self.team = team
        self.imageurl = imageurl
        self.bio = bio
    }
}
