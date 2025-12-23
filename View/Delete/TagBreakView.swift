//
//  hoge.swift
//  TodoList
//
//  Created by swiftUI on 2025/12/16.
//

import SwiftUI

struct TagBreakView: View {
    @State var tagList = ["#AAA", "#BBBBBBBBBB", "#CCCCC", "#DDDDDDDDDDDDDDD", "#EEEEEEEEEE"]
    
    var body: some View {
        GeometryReader { geometry in
            generateTags(geometry)
        }
        .padding()
    }
    
    private func generateTags(_ geometry: GeometryProxy) -> some View {
        var leading = CGFloat.zero
        var top = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
          ForEach(tagList, id: \.self) { tag in
              Tag(tag)
                  .padding([.horizontal, .vertical], 4)
                  .alignmentGuide(.leading, computeValue: { context in
                      if abs(leading - context.width) > geometry.size.width {
                          // 改行の場合はleadingをリセットする
                          leading = 0
                          // topも積算する
                          top -= context.height
                      }
                      
                      // 改行判定後に返却値を代入
                      let result = leading
                      
                      if tag == tagList.last {
                          // 複数回計算されるためリセットする
                          leading = 0
                      } else {
                          // leadingを積算する (次の基準とするため返却値に積算させない)
                          leading -= context.width
                      }
                      return result
                  })
                  .alignmentGuide(.top, computeValue: { _ in
                      let result = top
                      if tag == tagList.last {
                          // 複数回計算されるためリセットする
                          top = 0
                      }
                      return result
                  })
          }
        }
        .border(Color.gray)
        .navigationTitle("Tag Break")
    }
}

#Preview {
    TagBreakView()
}
