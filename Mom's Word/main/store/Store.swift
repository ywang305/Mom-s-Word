//
//  Store.swift
//  Mom's Word
//
//  Created by yao on 3/7/20.
//  Copyright © 2020 yao. All rights reserved.
//

import Foundation
import Combine

class Store: ObservableObject {
    static let shared = Store()
    
    @Published var wordListSet: Set<WordList>
    
    private init() {
        
        self.wordListSet = UserDefaults.standard.getWordListSet() ?? Set()
        
        let _wordList = WordList(name: "MLP-K 洗手")
        _wordList.list =  ["洗手", "比一比", "清又清", "最干净", "水"].enumerated().map{Word($0.element, seq: $0.offset)}

        if !self.wordListSet.contains(_wordList) {
            self.wordListSet.insert(_wordList)
        }
            
        
        
    }
    
    deinit {
        UserDefaults.standard.setWordListSet(value: self.wordListSet)
    }
}


class WordList: ObservableObject, Hashable, Identifiable {
    
    @Published var list: [Word] = []
    
    let id = UUID()
    var name : String
    
    init(name: String) {
        self.name = name        
    }
    
    static func == (lhs: WordList, rhs: WordList) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

enum UserDefaultsKeys : String {
    case wordListSet
}

extension UserDefaults{
    
    func setWordListSet(value: Set<WordList>) {
        set(value, forKey: UserDefaultsKeys.wordListSet.rawValue)
    }
    
    func getWordListSet()-> Set<WordList>? {
        return object(forKey: UserDefaultsKeys.wordListSet.rawValue) as? Set<WordList>
    }
    
}
