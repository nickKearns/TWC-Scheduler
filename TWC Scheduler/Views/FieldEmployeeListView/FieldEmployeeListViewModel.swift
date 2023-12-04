//
//  FieldEmployeeViewModel.swift
//  TWC Scheduler
//
//  Created by Nick Kearns on 12/3/23.
//

import Foundation

final class FieldEmployeeListViewModel: ObservableObject {
    @Published var projects: [Project] = []
    @Published var fieldEmployees: [FieldEmployee] = []
    
    init() {
        do {
            let url = Bundle.main.url(forResource: "exampleJSON", withExtension: ".json")!
            let data = try Data(contentsOf: url)
            let projectsData = try JSONDecoder().decode(AllProjects.self, from: data)
            projects.append(contentsOf: projectsData.projects)
            for project in projectsData.projects {
                fieldEmployees.append(contentsOf: project.fieldEmployees)
            }
        } catch {
            fatalError("JSON is missing")
        }
    }
}
