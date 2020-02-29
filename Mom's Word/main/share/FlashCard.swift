//
//  FlashCard.swift
//  eb_sui_4_abs
//
//  Created by yao on 2/17/20.
//  Copyright © 2020 yao. All rights reserved.
//

import SwiftUI


extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .scale)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
    static func moveAndFadeHandler(_ offset: CGSize) -> AnyTransition {
        let w = offset.width
        let h = offset.height
        let outEdge: Edge = abs(w)>abs(h) ? (w > 0 ? .trailing : .leading ) : ( h>0 ? .bottom : .top)
        
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .scale)
            .combined(with: .opacity)
        let removal = AnyTransition.move(edge: outEdge)
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}


struct FlashCard: View {
    let word: String
    let onRemoval: (()->())?
    
    
    var drag : some Gesture {
        DragGesture().onChanged{
            self.offset=$0.translation
        }.onEnded{
            let w = $0.translation.width
            let h = $0.translation.height
            let d = sqrt(w*w+h*h)
            if d>100 {
                withAnimation(.easeInOut(duration: 1.0)) {
                    self.show.toggle()
                    self.onRemoval?()
                }
                
            } else {
                self.offset = .zero
            }
        }
    }
    
    @State private var show = false
    @State private var offset: CGSize = .zero
    
    
    var body: some View {
        
        VStack {
            if(self.show) {
                Text(self.word)
                .modifier(CardStyle())
                .offset(self.offset)
                    .gesture(self.drag)
                    .transition(.moveAndFadeHandler(self.offset))
            }
            
        }.onAppear{
            withAnimation(.easeInOut(duration: 1.0)) {
                self.show=true
            }
        }
        
    }
}

struct CardStyle: ViewModifier {
    let color = Color("FlashCardColor")
    
    func body(content: Content) -> some View {
        return content
            .padding()
            .frame(maxWidth: 300, maxHeight:200)
            .font(.largeTitle)
//            .foregroundColor(Color.black)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.yellow.opacity(0.8), lineWidth: 2))            //.shadow(radius: 10)
    }
    
}

struct FlashCard_Previews: PreviewProvider {
    static var previews: some View {
        FlashCard(word: "sun" ) {}
            .environment(\.colorScheme, .dark)
    }
}
