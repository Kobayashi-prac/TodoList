//
//  CalenderView.swift
//  TodoList
//
//  Created by swiftUI on 2025/12/14.
//

import SwiftUI

struct CalenderView: View {
    
    /// 一週間の日付配列
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    /// 曜日
    let weekdays = ["日", "月", "火", "水", "木", "金", "土"]
    /// 1ヶ月
    let days = Array(1..<31)
    
    var body: some View {
        // alignmentGuideを使う
        // layoutプロトコルを使う
        // GeometryReaderとoffsetを使う
        // LazyVGridを使う
        VStack {
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(weekdays, id: \.self) { day in
                    Text("\(day)")
                }
            }
            ScrollView {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(days, id: \.self) { date in
                        Text("\(date)")
                    }
                }
            }
        }
    }


}

#Preview {
    CalenderView()
}
