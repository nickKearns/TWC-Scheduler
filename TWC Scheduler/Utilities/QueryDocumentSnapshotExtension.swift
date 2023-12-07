//
//  QueryDocumentSnapshotExtension.swift
//  TWC Scheduler
//
//  Created by Nick Kearns on 12/5/23.
//

import Foundation
import FirebaseFirestore

extension QueryDocumentSnapshot {
    func decoded<Type: Decodable>() throws -> Type {
        let jsonData = try JSONSerialization.data(withJSONObject: data())
        let object = try JSONDecoder().decode(Type.self, from: jsonData)
        return object
    }
}

extension QuerySnapshot {
    func decoded<Type: Decodable>() throws -> [Type] {
        let objects: [Type] = try documents.map { try $0.decoded() }
        return objects
    }
}
