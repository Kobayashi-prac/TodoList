//
//  MonthsView.swift
//  TodoList
//
//  Created by swiftUI on 2025/12/23.
//

import SwiftUI

struct MonthsView: View {
    
    /// 一週間の日付配列
    let columns = Array(repeating: GridItem(.flexible()), count: 7)

    /// 1ヶ月
    let days = Array(1..<31)

    @Binding var isVisibleTodoList: Bool
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 3) {
                ForEach(days, id: \.self) { date in
                    ZStack {
                        // isPressedの通知を受け取るのは押されたボタンだけ
                        Button {
                            withAnimation {
                                isVisibleTodoList = true
                            }
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
    MonthsView(isVisibleTodoList: .constant(false))
}
