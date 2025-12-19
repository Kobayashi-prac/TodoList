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
                                .background(backgroundColor)

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
    
    /// 背景塗りつぶしで角丸なボタンスタイル
    struct RoundedButtonStyle: ButtonStyle {
        @Environment(\.isEnabled) var isEnabled
        
        var color: Color = .blue
        private let disabledColor: Color = .init(uiColor: .lightGray)
        private let backgroundColor: Color = .white
        private let cornerRadius: CGFloat = 8.0
        private let lineWidth: CGFloat = 2.0
        
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .fontWeight(.bold)
                .foregroundColor(.white)
                // 有効無効でカラーを変更
                .background(isEnabled ? color : disabledColor)
                // 押下時かどうかで透明度を変更
                .opacity(configuration.isPressed ? 0.5 : 1.0)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        }
    }


}

#Preview {
    CalenderView()
}
