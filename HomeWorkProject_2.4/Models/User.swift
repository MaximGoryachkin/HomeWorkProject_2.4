//
//  User.swift
//  HomeWorkProject_2.4
//
//  Created by Максим on 16.07.2021.
//

import Foundation

struct User {
    let login: String
    let password: String
    let persons: Person
}

struct Person {
    let firstName: String
    let lastName: String
    let sex: Sex
    let age: Int
    let currentCity: String
    let education: Education
    let hobby: [Hobby]
    let eyeColor: Color
    let photoName: String
    
    static func getPerson() -> [Person] {
        [
            Person.init(firstName: "Maxim",
                        lastName: "Goryachkin",
                        sex: .male,
                        age: 26,
                        currentCity: "Saint-Petersburg",
                        education: .higher,
                        hobby: [.reading,
                                .sport,
                                .cooking,
                                .technology,
                                .tourism],
                        eyeColor: .green,
                        photoName: "logo"),
        ]
    }
}

enum Sex: String {
    case male = "🙋🏽‍♂️"
    case female = "🙋🏼‍♀️"
}

enum Education: String {
    case school
    case secondary
    case higher
}

enum Hobby: String {
    case sport
    case reading
    case cooking
    case music
    case photo
    case tourism
    case communication
    case technology
}

enum Color: String {
    case blue
    case green
    case brown
}

