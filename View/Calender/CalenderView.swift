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
    
    @State var backgroundColor: Color = .white
    @State var isPresented: Bool = false
    
    var body: some View {

        NavigationStack {
            
            VStack {
                
                // LazyVGridを使う
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(weekdays, id: \.self) { day in
                        Text("\(day)")
                    }
                }
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 3) {
                        ForEach(days, id: \.self) { date in
                            ZStack {
                                
                                Button {
                                    backgroundColor = .gray
//                                    isPresented = true
                                } label: {
                                    Text("")
                                        .frame(width: 55, height: 100.0)
                                }
                                .buttonStyle(pressedButtonStyle())

                                Text("\(date)")
                                
                            }
                        }
                    }
                }
                .fullScreenCover(isPresented: $isPresented) {
                    EmptyView()
                }
            }
        }
    }
    
    /// ボタンが押された時のButtonStyle
    struct pressedButtonStyle: ButtonStyle {
        
        var backgroundColor: Color = .gray
        var pressedBackgroundColor: Color = .white
        
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .background(backgroundColor(isPressed: configuration.isPressed))
        }
        
        func backgroundColor(isPressed: Bool) -> Color {
            return isPressed ? backgroundColor : pressedBackgroundColor
        }
        
    }

}

#Preview {
    CalenderView()
}
