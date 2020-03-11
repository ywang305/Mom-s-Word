//
//  CardStack.swift
//  eb_sui_4_abs
//
//  Created by yao on 2/23/20.
//  Copyright © 2020 yao. All rights reserved.
//

import SwiftUI

struct CardStack: View {
    
    @ObservedObject private var store = Store.shared
    @ObservedObject private var wlObj : WordList = WordList(name: "")
    @State private var lastIndex=0
    
    init(title: String) {        
        wlObj = self.store.wordListSet.first(where: {$0.name==title}) ?? WordList(name: title)
    }
    var words : [Word] {
        wlObj.list
    }
    
    
    var body: some View {
        VStack{
            Spacer()
            ZStack {
                ForEach(words) { w in
                    FlashCard(word: w.word, onRemoval: { self.lastIndex -= 1 })
                        .scaleEffect( self.getScale(w.id))
                        .offset(self.getOffSize(w.id))
                }
            }
            Spacer()
            
            Button(action: {}) {
                NavigationLink(destination: WordListView(title: wlObj.name)) {
                    Image(systemName: "list.number")
                }.font(.title)
            }.padding()
            
        }.onAppear{
            self.lastIndex = self.wlObj.list.count
        }
        
    }
}


extension CardStack {
    private func getScale(_ seq: Int) -> CGFloat {
        let endInd = self.lastIndex
        var scale: CGFloat = 0.8
        if seq==endInd-1 {
            scale = 1
        } else if seq==endInd-2 {
            scale = 0.9
        }
        return scale
    }
    
    private func getOffSize(_ seq: Int) -> CGSize {
        let endInd = self.lastIndex
        var size: CGSize = CGSize(width: 0, height: -60)
        if seq==endInd-2 {
            size.height = -30
        } else if seq==endInd-1 {
            size.height = .zero
        }
        
        return size
    }
}

struct CardStack_Previews: PreviewProvider {
    static var previews: some View {
        CardStack(title: "OK")
    }
}
