//
//  CardStore.swift
//  eb_sui_4_abs
//
//  Created by yao on 2/18/20.
//  Copyright © 2020 yao. All rights reserved.
//

import Foundation
import Combine

class WordStore: ObservableObject {
    static let shared = WordStore()
    
    @Published var readingWords : [Word] = ["sun", "moon", "girl", "tree", "car", "school", "touch"].enumerated().map{ i, str in
        Word(str, seq: i)
    }
    
    func insert(word: String) -> Void {
        if !readingWords.contains(where: { $0.word==word}) {
            let seq = self.readingWords.count
            self.readingWords.append(Word(word, seq: seq))
        }
    }
    
    func remove(at index: Int) {
        self.readingWords.remove(at: index)
    }
}
