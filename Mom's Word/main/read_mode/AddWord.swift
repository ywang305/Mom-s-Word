//
//  AddWord.swift
//  eb_sui_4_abs
//
//  Created by yao on 2/20/20.
//  Copyright © 2020 yao. All rights reserved.
//

import SwiftUI

struct AddWord: View {
    @ObservedObject private var wordstore = WordStore.shared
    
    @State private var word: String = ""
    

    private func submitHandler() {
        if !self.word.isEmpty {
            self.wordstore.insert(word: word)
            self.word = ""
        }
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            TextField("Add New Word To List", text: $word, onCommit: submitHandler)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: submitHandler) {
                Text("ADD")
            }
        }
    }
}



struct AddWord_Previews: PreviewProvider {
    static var previews: some View {
        AddWord()
    }
}
