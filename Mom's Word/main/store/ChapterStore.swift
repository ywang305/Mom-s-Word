//
//  ChapterStore.swift
//  Mom's Word
//
//  Created by yao on 3/2/20.
//  Copyright © 2020 yao. All rights reserved.
//

import Foundation
//
//  CardStore.swift
//  eb_sui_4_abs
//
//  Created by yao on 2/18/20.
//  Copyright © 2020 yao. All rights reserved.
//

import Foundation
import Combine

typealias ChapterMap = [String: Chapter]


class ChapterStore: ObservableObject {
    
    static let shared = ChapterStore()
    
    
    private init() {
        self.chapterMap = UserDefaults.standard.getChapterMap() ?? ChapterMap()
        self.chapters = UserDefaults.standard.getChapters() ?? [Chapter]()
    }
    deinit {
        UserDefaults.standard.setChapterMap(value: self.chapterMap)
        UserDefaults.standard.setChapters(value: self.chapters)
    }
    
    @Published var chapterMap: ChapterMap
    @Published var chapters: [Chapter]
    
}


extension UserDefaults{
    
    func setChapterMap(value: ChapterMap) {
        set(value, forKey: UserDefaultsKeys.chapterMap.rawValue)
    }
    
    func getChapterMap()-> ChapterMap? {
        return object(forKey: UserDefaultsKeys.chapterMap.rawValue) as? ChapterMap
    }
    
    func setChapters(value: [Chapter]) {
        set(value, forKey: UserDefaultsKeys.chapters.rawValue)
    }
    
    func getChapters()-> [Chapter]? {
        return object(forKey: UserDefaultsKeys.chapters.rawValue) as? [Chapter]
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
    case chapterMap
    case chapters
}
