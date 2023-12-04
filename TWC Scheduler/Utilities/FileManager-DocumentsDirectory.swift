//
//  FileManager-DocumentsDirectory.swift
//  TWC Scheduler
//
//  Created by Nick Kearns on 12/3/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
