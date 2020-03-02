//
//  EntryItem.swift
//  Mom's Word
//
//  Created by yao on 3/1/20.
//  Copyright © 2020 yao. All rights reserved.
//

import SwiftUI

struct EntryItem: View {
    let title: String
    let icon: Image?
    
    @State private var progress: CGFloat = .zero
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                icon
                Text(self.title)
            }
            ProgressBar(value: $progress)
        }
    }
}

struct EntryItem_Previews: PreviewProvider {
    static var previews: some View {
        EntryItem(title: "test title", icon: nil)
    }
}
