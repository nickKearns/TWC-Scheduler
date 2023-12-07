//
//  FieldEmployeeViewModel.swift
//  TWC Scheduler
//
//  Created by Nick Kearns on 12/3/23.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

final class FieldEmployeeListViewModel: ObservableObject {
    @Published var projects: [Project] = []
    @Published var fieldEmployees: [FieldEmployee] = []
    
    private var db = Firestore.firestore()
    
    init() {
        
        let _ = db.collection("TWC").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                fatalError("No Documents")
            }
            self.projects = documents.compactMap { querySnapshot -> Project? in
                if let fieldEmployees = try? querySnapshot.decoded() as [FieldEmployee] {
                    self.fieldEmployees = fieldEmployees
                    print(fieldEmployees)
                }
                return try? querySnapshot.data(as: Project.self)
            }
            print(self.projects)
        }
    }
    
    func addFieldEmployee(_ fieldEmployee: FieldEmployee, project: Project) {
        project.fieldEmployees?.append(fieldEmployee)
        do {
            try db.collection("TWC").document(project.id!).setData(from: project)
        }
        catch {
            print("error while trying to add employee to a project")
        }
    }
    
    func addProject(_ project: Project) {
        do {
            let _ = try db.collection("TWC").addDocument(from: project)
        }
        catch {
            print("Error while trying to save a new project")
        }
    }
}
