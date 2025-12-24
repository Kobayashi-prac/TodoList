//
//  CalenderView.swift
//  TodoList
//
//  Created by swiftUI on 2025/12/14.
//

import SwiftUI

struct CalenderView: View {
    
    /// Todoリストの表示を制御するフラグ
    @State var isVisibleTodoList = false
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                VStack(spacing: 0) {
                    
                    MonthView()
                    
                    WeekdayView()
                    
                    ForEach(1...2, id: \.self) { i in
                            DateView(isVisibleTodoList: $isVisibleTodoList)
                    }
                    
                }
                // .move(edge: .bottom)の場合、fullScreenCoverでも同様のアニメーション
                if isVisibleTodoList {
                    ToDoListView()
                        .transition(.move(edge: .bottom))
                }
            }
        }
    }
}

#Preview {
    CalenderView()
}
