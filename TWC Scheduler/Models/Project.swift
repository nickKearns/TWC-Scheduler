//
//  Project.swift
//  TWC Scheduler
//
//  Created by Nick Kearns on 12/3/23.
//

import Foundation
import FirebaseFirestoreSwift

struct AllProjects: Codable {
    let projects: [Project]
}

class Project: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var location: String
    var fieldEmployees: [FieldEmployee]?
}
