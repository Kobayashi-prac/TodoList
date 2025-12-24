//
//  MonthView.swift
//  TodoList
//
//  Created by swiftUI on 2025/12/25.
//

import SwiftUI

struct MonthView: View {
    var body: some View {
        Text("12月")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.largeTitle)
            .bold()
    }
}

#Preview {
    MonthView()
}
