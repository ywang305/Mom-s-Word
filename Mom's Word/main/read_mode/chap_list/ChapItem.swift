//
//  EntryItem.swift
//  Mom's Word
//
//  Created by yao on 3/1/20.
//  Copyright © 2020 yao. All rights reserved.
//

import SwiftUI

struct ChapItem: View {
    @ObservedObject private var store = Store.shared
    
    let name: String
    @State private var openAlert = false
    
    private var chap: WordList? {
        store.wordListSet.first(where: {$0.name==self.name})
    }
    
    @State private var progress: CGFloat = .zero
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text(chap?.name ?? "")
                Spacer()
                DeleteChapter(chap: chap)
            }
            HStack{
                Text("progress").font(.subheadline)
                ProgressBar(value: $progress)
            }
        }.padding()
            .background(Color.green)
            .cornerRadius(16).shadow(radius: 8)
    }
}

struct ChapItem_Previews: PreviewProvider {
    static var previews: some View {
        ChapItem(name: "MLP-K 洗手")
    }
}
