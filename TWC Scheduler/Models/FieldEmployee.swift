//
//  FieldUser.swift
//  TWC Scheduler
//
//  Created by Nick Kearns on 12/3/23.
//

import Foundation
import FirebaseFirestoreSwift

struct FieldEmployee: Identifiable, Codable {
    var id: String
    var name: String
    var project: String
}
