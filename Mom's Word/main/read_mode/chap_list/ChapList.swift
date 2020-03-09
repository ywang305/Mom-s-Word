//
//  Entry.swift
//  Mom's Word
//
//  Created by yao on 2/29/20.
//  Copyright © 2020 yao. All rights reserved.
//

import SwiftUI


struct ChapList: View {
    @ObservedObject private var store = Store.shared
    
    private var chapters: [WordList] {
        store.wordListSet.sorted(by: {$0.name<$1.name})
    }
    
    @State private var openCreate = false
    
    var body: some View {
        NavigationView {
             VStack {
                ForEach(chapters) { chap in
                    NavigationLink(destination: CardStack(title: chap.name)) {
                        ChapItem(name: chap.name )
                    }
                }
                Spacer(minLength: 0).frame(maxWidth: .infinity)
             }.listStyle(GroupedListStyle())
             .overlay(AddChapter().padding(20), alignment: .bottomTrailing)
            .padding()
            .navigationBarTitle("Reading Cards")
        }
        
    }
}

struct ChapList_Previews: PreviewProvider {
    static var previews: some View {
        ChapList()//.previewDevice("iPhone SE")
    }
}
