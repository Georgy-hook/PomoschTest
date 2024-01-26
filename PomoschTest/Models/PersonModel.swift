//
//  PersonModel.swift
//  PomoschTest
//
//  Created by Georgy on 25.01.2024.
//

import Foundation

struct Person{
    var fullName: String
    var age: Int
    var story: String
    var gender: Gender
    var city: String
    var photoURL: URL?
}

enum Gender{
    case Male
    case Female
}
