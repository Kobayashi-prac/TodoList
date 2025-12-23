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
        
        NavigationStack {
            
            VStack {
                weekdayView
                monthView
            }
        }
    }
    
    var weekdayView: some View {
        // LazyVGridを使う
        LazyVGrid(columns: columns, spacing: 0) {
            ForEach(weekdays, id: \.self) { day in
                Text("\(day)")
            }
        }
    }
    
    var monthView: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 3) {
                ForEach(days, id: \.self) { date in
                    ZStack {
                        // isPressedの通知を受け取るのは押されたボタンだけ
                        Button {
                            print("pressedButton")
                        } label: {
                            // この引数はViewに準拠していればなんでも返して良い
                            Text("")
                                .frame(width: 55, height: 50.0)
                        }
                        .buttonStyle(pressedButtonStyle())
                        
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
