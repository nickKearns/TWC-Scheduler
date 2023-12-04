//
//  FieldUser.swift
//  TWC Scheduler
//
//  Created by Nick Kearns on 12/3/23.
//

import Foundation

struct FieldEmployee: Identifiable, Codable {
    let id: UUID
    let name: String
    let currentProject: String?
    
    static let example = FieldEmployee(id: UUID(), name: "Nick", currentProject: "Landmark")
}
