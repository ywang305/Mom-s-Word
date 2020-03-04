//
//  AddChapter.swift
//  Mom's Word
//
//  Created by yao on 3/3/20.
//  Copyright © 2020 yao. All rights reserved.
//

import SwiftUI

struct AddChapter: View {
    @ObservedObject private var store = ChapterStore.shared
    private var count: Int {
        self.store.chapters.count
    }
    
    var body: some View {
        
        NavigationLink(destination: WordListPage()) {
            Image(systemName: "plus")
                .font(.title)
                .padding()
                .foregroundColor(.white)
                .background(Color.orange)
                .cornerRadius(.infinity)
        }.shadow(radius: 6)
    }
    
}

struct AddChapter_Previews: PreviewProvider {
    static var previews: some View {
        AddChapter()
    }
}
