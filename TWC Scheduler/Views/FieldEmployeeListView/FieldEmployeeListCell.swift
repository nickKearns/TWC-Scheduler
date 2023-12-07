//
//  FieldEmployeeListCell.swift
//  TWC Scheduler
//
//  Created by Nick Kearns on 12/5/23.
//

import SwiftUI

struct FieldEmployeeListCell: View {
    var fieldEmployee: FieldEmployee
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 20, height:20)
            Text(fieldEmployee.name)
        }
    }
}

#Preview {
    FieldEmployeeListCell(fieldEmployee: FieldEmployee(id: "1", name: "Nick", project: "Landmark"))
}
