//
//  ExerciseDetailModel.swift
//  Beachbody
//
//  Created by David Selioutsky on 6/18/21.
//

import Foundation

struct ExerDetail: Codable {
    
    var id: Int
    var name: String?
    var category: Category?
    var equipment: [Equipment]?
    
    init(_ id: Int) {
        self.id = id
    }
}

struct Category: Codable {
    
    var id: Int
    var name: String
    
}

struct Equipment: Codable, Identifiable {
    
    var id: Int
    var name: String
    
}
