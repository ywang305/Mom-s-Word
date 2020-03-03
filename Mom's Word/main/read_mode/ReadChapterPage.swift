//
//  Entry.swift
//  Mom's Word
//
//  Created by yao on 2/29/20.
//  Copyright © 2020 yao. All rights reserved.
//

import SwiftUI

struct AddEntry: View {
    
    
    
    var body: some View {
        Button(action: { }) {
            Text("Create A Word Set")
        }
    }
}

struct ReadChapter: View {
    @ObservedObject private var chapterStore = ChapterStore.shared
    private var chapters: [Chapter] {
        self.chapterStore.chapters
    }
    
    @State private var openCreate = false
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView<<#Content: View#>>([.vertical], showsIndicators: true) {
                    VStack{
                        ForEach(chapters) { chap in
                            NavigationLink(destination: Text("tttt")) {
                                EntryItem(title: chap.name, icon: nil )
                            }
                        }
                    }
                }
                NavigationLink(destination: WordListPage()) {
                    Button(action: {self.openCreate.toggle()}) {
                        HStack{
                            Image(systemName: "plus.square")
                            Text("New Card")
                        }.font(.title)
                            .padding().border(ButtonStyle())
                        
                    }
                }
            }.navigationBarTitle("Reading Cards")
        }
    }
}

struct ReadEntry_Previews: PreviewProvider {
    static var previews: some View {
        ReadChapter()
    }
}
