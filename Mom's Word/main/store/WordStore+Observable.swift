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
    typealias WordsEntry = [String: Array<Word>]
    
    static let shared = WordStore()
    
    
    init() {
        wordsEntry = UserDefaults.standard.getWordsEntry() ?? WordsEntry()
    }
    deinit {
        UserDefaults.standard.setWordsEntry(value: self.wordsEntry)
    }
    
    @Published var wordsEntry: WordsEntry
    
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


extension UserDefaults{
    typealias WordsEntry = [String: Array<Word>]
    
    func setWordsEntry(value: WordsEntry) {
        set(value, forKey: UserDefaultsKeys.wordsEntry.rawValue)
    }
    
    func getWordsEntry()-> WordsEntry? {
        return object(forKey: UserDefaultsKeys.wordsEntry.rawValue) as? WordsEntry
    }

    //MARK: Check Login
    func setLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }

    func isLoggedIn()-> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }

    //MARK: Save User Data
    func setUserID(value: Int){
        set(value, forKey: UserDefaultsKeys.userID.rawValue)
    }

    //MARK: Retrieve User Data
    func getUserID() -> Int{
        return integer(forKey: UserDefaultsKeys.userID.rawValue)
    }
}

enum UserDefaultsKeys : String {
    case isLoggedIn
    case userID
    case wordsEntry
}
