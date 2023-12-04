//
//  Project.swift
//  TWC Scheduler
//
//  Created by Nick Kearns on 12/3/23.
//

import Foundation

struct AllProjects: Codable {
    let projects: [Project]
}

struct Project: Identifiable, Codable {
    let id: UUID
    let name: String
    let location: String
    let fieldEmployees: [FieldEmployee]
    static let example = Project(id: UUID(), name: "Landmark", location: "Boston", fieldEmployees: [FieldEmployee.example])
}
