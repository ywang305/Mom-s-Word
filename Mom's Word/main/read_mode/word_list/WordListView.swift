//
//  WordListPage.swift
//  eb_sui_4_abs
//
//  Created by yao on 2/24/20.
//  Copyright © 2020 yao. All rights reserved.
//

import SwiftUI

struct WordListView: View {
    @ObservedObject private var store = Store.shared
    @ObservedObject private var wlObj : WordList = WordList(name: "")
    @State private var openTitle = false
    @State private var localTitle: String
    
    @State var isEditMode: EditMode = .inactive
    
    
    init( title: String ){
        let df = DateFormatter()
        df.dateFormat = "MMMd,y HH:mm:ss"
        
        _localTitle = State(initialValue: title.isEmpty ? df.string(from: Date()) : title )
        
        wlObj = self.store.wordListSet.first(where: {
            $0.name == localTitle
        }) ?? WordList(name: title)
    }
    
    //MARK: Computed Property
    var wordList: WordList? {
        store.wordListSet.first(where: {
            $0.name == localTitle
        })
    }
    var words: [Word] {
        wlObj.list
    }
    
    //MARK: View
    var body: some View {
        VStack {
            if self.isEditMode == .active {
                EditTitle(isOn: $openTitle, title: $localTitle)
            }
            AddWord { newStr in
                if !self.words.contains(where: { $0.word == newStr }) {
                    let cnt = self.words.count
                    let word = Word(newStr, seq: cnt)
                    self.wlObj.list.append(word)
                }
            }.padding()
            
            List {
                ForEach(words) {
                    Text("\($0.word)")
                }.onDelete(perform: self.removeRows)
            }
            
        }
        .navigationBarItems(trailing: EditButton())
        .navigationBarTitle( "\(self.localTitle)", displayMode: .inline)
        .environment(\.editMode, self.$isEditMode)
        .onAppear{
        }
        .onDisappear{
            let wl = self.store.wordListSet.first(where: {
                $0.name == self.localTitle
            })
            if wl==nil, !self.words.isEmpty {
                if self.wlObj.name != self.localTitle {
                    self.wlObj.name = self.localTitle
                }
                self.store.wordListSet.insert(self.wlObj)
            }
            
        }
        
    }
    
    //MARK: functions
    func removeRows(at offsets: IndexSet) {
        if let wl = self.wordList {
            wl.list.remove(atOffsets: offsets)
        }
    }
    func changeTitle() {
        self.openTitle.toggle()
    }
}






struct WordList_Previews: PreviewProvider {
    static var previews: some View {
        WordListView(title: "")
    }
}
