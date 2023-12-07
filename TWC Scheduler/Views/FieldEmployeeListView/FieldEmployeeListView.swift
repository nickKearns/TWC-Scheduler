//
//  FieldEmployeeListView.swift
//  TWC Scheduler
//
//  Created by Nick Kearns on 12/3/23.
//

import SwiftUI

struct FieldEmployeeListView: View {
    @StateObject private var viewModel = FieldEmployeeListViewModel()
    
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, pinnedViews: .sectionHeaders) {
                    ForEach(viewModel.projects) { project in
                        Section {
                            ForEach(project.fieldEmployees ?? []) { employee in
                                List {
                                    FieldEmployeeListCell(fieldEmployee: employee)
                                }
                            }
                        } header: {
                            Text(project.name)
                                .font(.title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.top, .bottom, .trailing], 5)
                                .background(.background)
                        }
                    }
                }
            }
        }
        .navigationTitle("TWC Projects")
        .environmentObject(viewModel)
        .toolbar {
            Button() {
                
            } label: {
                Label("Add New Employee", systemImage: "person.badge.plus")
            }
        }
    }
}

#Preview {
    ContentView()
}
