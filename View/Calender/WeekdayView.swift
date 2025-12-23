//
//  WeekdayView.swift
//  TodoList
//
//  Created by swiftUI on 2025/12/23.
//

import SwiftUI

/// 一週間の日付配列
let columns = Array(repeating: GridItem(.flexible(), spacing: 3), count: 7)

/// 曜日
let weekdays = ["日", "月", "火", "水", "木", "金", "土"]

struct WeekdayView: View {
    var body: some View {
        // LazyVGridを使う
        LazyVGrid(columns: columns, spacing: 0) {
            ForEach(weekdays, id: \.self) { day in
                Text("\(day)")
            }
            .frame(maxWidth: .infinity)
            .border(Color.black, width: 1)
        }
    }
}

#Preview {
    WeekdayView()
}
