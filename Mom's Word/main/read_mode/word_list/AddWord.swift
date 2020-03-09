//
//  AddWord.swift
//  eb_sui_4_abs
//
//  Created by yao on 2/20/20.
//  Copyright © 2020 yao. All rights reserved.
//

import SwiftUI

struct AddWord: View {
    @State private var word: String = ""

    let onComplete: ((_ value: String )->())
    

    private func submit() {
        if !self.word.isEmpty {
            onComplete(self.word)
            self.word = ""
        }
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            TextField("Add New Word To List", text: $word, onCommit: submit).padding()

            Button(action: submit) {
                Text("ADD")
            }
        }.padding(.horizontal)
            .background(RoundedRectangle(cornerRadius: 8).stroke())
    }
}



struct AddWord_Previews: PreviewProvider {
    
    static var previews: some View {
        AddWord(onComplete: {
            print($0)
        })
    }
}
