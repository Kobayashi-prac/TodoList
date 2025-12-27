//
//  MonthsView.swift
//  TodoList
//
//  Created by swiftUI on 2025/12/23.
//

import SwiftUI

struct DateView: View {
    
    /// 一週間の日付配列
    let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 7)
    
    /// 一月の日数
    var days: Range<Int> {
        guard let range = CalenderUtil.shared.getDaysInMonth(date: Date()) else {
            return 0..<0
        }
        return range
    }
    
    /// 月初の曜日
    var firstWeekdayOfMonth: Int {
        let firstDay = CalenderUtil.shared.getFirstDay(year: 2025, month: 12)
        let weekday = CalenderUtil.shared.getFirstWeekday(firstDay: firstDay)
        return weekday
    }
    
    /// 差分
    var difference: Int {
        firstWeekdayOfMonth - 1
    }
    
    /// 合計
    var total: Range<Int> {
        let upperBound = days.upperBound + difference
        return days.lowerBound ..< upperBound
    }
    
    @Binding var isVisibleTodoList: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            
            // 上線
            Rectangle()
                .frame(height: 1)
            
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(total, id: \.self) { date in
                    VStack {
                        
                        HStack {
                            
                            ZStack {
                                
                                // isPressedの通知を受け取るのは押されたボタンだけ
                                Button {
                                    withAnimation {
                                        //                                            isVisibleTodoList = true
                                    }
                                } label: {
                                    // この引数はViewに準拠していればなんでも返して良い
                                    Text("")
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                }
                                .frame(height: 100)
                                .buttonStyle(pressedButtonStyle())
                                
                                VStack {
                                    HStack {
                                        if date - difference <= 0 {
                                        }
                                        Text("\(date - difference)")
                                        Spacer()
                                    }
                                    Spacer()
                                }
                                
                            }
                            
                            // 横線
                            Rectangle()
                                .frame(width: 1)
                            
                        }
                        
                        // 下線
                        Rectangle()
                            .frame(height: 1)
                        
                    }
                }
            }
        }
    }
}

#Preview {
    DateView(isVisibleTodoList: .constant(false))
}
