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
    
    /// 1ヶ月
    let days = Array(1..<31)
    
    @Binding var isVisibleTodoList: Bool
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                
                // 上線
                Rectangle()
                    .frame(height: 1)
                
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(days, id: \.self) { date in
                        VStack {
                            
                            HStack {
                                
                                ZStack {
                                    
                                    // isPressedの通知を受け取るのは押されたボタンだけ
                                    Button {
                                        withAnimation {
                                            isVisibleTodoList = true
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
                                            Text("\(date)")
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
}

#Preview {
    DateView(isVisibleTodoList: .constant(false))
}
