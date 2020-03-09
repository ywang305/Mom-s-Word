//
//  RemChapter.swift
//  Mom's Word
//
//  Created by yao on 3/9/20.
//  Copyright © 2020 yao. All rights reserved.
//

import SwiftUI

struct DeleteChapter: View {
    @ObservedObject private var store = Store.shared
    @State private var open = false
    let chap: WordList?
    
    var body: some View {
        Button(action: {
            self.open = true}) {
                Image(systemName: "xmark.circle").font(.title)
        }.actionSheet(isPresented: $open) {
            ActionSheet(title:Text("Delete This List"), buttons: [.destructive(Text("Delete"), action: deleteItem), .cancel()])
        }
    }
    
    func deleteItem() {
        if let chap = self.chap {
            self.store.wordListSet.remove(chap)
        }
        
    }
}

struct DeleteChapter_Previews: PreviewProvider {
    static var previews: some View {
        DeleteChapter(chap: nil)
    }
}
