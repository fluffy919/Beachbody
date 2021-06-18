//
//  Exercise.swift
//  Beachbody
//
//  Created by David Selioutsky on 6/17/21.
//

import Foundation

struct Exer: Codable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [Exercise]
    
    init() {
        self.count = 0
        self.results = []
    }
}

struct Exercise: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var exercise_base: Int
    var status: String
    var description: String
    var creation_date: String
    var category: Int
    var muscles: [Int]
    var muscles_secondary: [Int]
    var equipment: [Int]
    var language: Int
    var license: Int
    var license_author: String
    var variations: [Int]
    
}
