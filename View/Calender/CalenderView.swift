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
                VStack {
                    WeekdayView()
                    
                    Divider()
                        .border(Color.black, width: 0)
                    
                    MonthsView(isVisibleTodoList: $isVisibleTodoList)
                }
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
