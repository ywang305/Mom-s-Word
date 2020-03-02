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

struct ReadEntry: View {
    @ObservedObject private var wordStore = WordStore.shared
    private var entryMap: WordStore.WordsEntry {
        self.wordStore.wordsEntry
    }
    
    var body: some View {
        Text("")
    }
}

struct ReadEntry_Previews: PreviewProvider {
    static var previews: some View {
        ReadEntry()
    }
}
