//
//  ProgressBar.swift
//  Mom's Word
//
//  Created by yao on 3/1/20.
//  Copyright © 2020 yao. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var value: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .center) {
                ZStack(alignment: .leading) {
                    Capsule().opacity(0.1)
                    Capsule()
                        .frame(width: self.getProgressBarWidth(geometry: geometry)) // 5
                        .foregroundColor(Color.purple) // 6
                    .animation(.easeIn)
                }
                .frame(height:10)
                Text("\(self.getPercentage(self.value))").font(Font.caption)
            }
        }.frame(height: 10)
    }
    
    func getProgressBarWidth(geometry:GeometryProxy) -> CGFloat {
        let frame = geometry.frame(in: .global)
        return frame.size.width * value
    }

    func getPercentage(_ value:CGFloat) -> String {
        let intValue = Int(ceil(value * 100))
        return "\(intValue) %"
    }
}

struct ProgressBar_Previews: PreviewProvider {
    @State static var progress: CGFloat = 0.4
    
    static var previews: some View {
        ProgressBar(value: $progress)
    }
}
