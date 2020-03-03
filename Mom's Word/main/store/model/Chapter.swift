//
//  Chapter.swift
//  Mom's Word
//
//  Created by yao on 3/2/20.
//  Copyright © 2020 yao. All rights reserved.
//

import Foundation
import SwiftUI
/*
 Chapter is a set of words
 */
struct Chapter: Identifiable {
    let id: String
    let name: String
    let icon: Image?
    var wordList: [Word]
    var progress: CGFloat {
        0.4
    }
}

