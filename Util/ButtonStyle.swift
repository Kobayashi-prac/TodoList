//
//  ButtonStyle.swift
//  TodoList
//
//  Created by swiftUI on 2025/12/23.
//

import Foundation
import SwiftUI

/// ボタンが押された時のButtonStyle
struct pressedButtonStyle: ButtonStyle {
    
    /// 通常の背景色
    /// clearだとタップアクションに反応しない
    var backgroundColor: Color = .white
    /// ボタンタップ時の背景色
    var pressedBackgroundColor: Color = .gray
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(backgroundColor(isPressed: configuration.isPressed))
    }
    
    func backgroundColor(isPressed: Bool) -> Color {
        return isPressed ? pressedBackgroundColor : backgroundColor
    }
    
}
