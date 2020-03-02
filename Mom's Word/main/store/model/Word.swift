//
//  Word.swift
//  eb_sui_4_abs
//
//  Created by yao on 2/27/20.
//  Copyright © 2020 yao. All rights reserved.
//

import Foundation
import SwiftUI

enum Aquired {
    case known
    case blur
    case unknown
}

struct Word {
    let id : Int
    let word: String
    let icon: Image?
    
    
    init(_ word: String, seq id: Int, icon:Image?=nil) {
        self.id = id
        self.word = word
        self.icon = icon
    }
}



extension Word: Identifiable { }
