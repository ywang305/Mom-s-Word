//
//  AddChapter.swift
//  Mom's Word
//
//  Created by yao on 3/3/20.
//  Copyright © 2020 yao. All rights reserved.
//

import SwiftUI

struct AddChapter: View {

    
    var body: some View {
        NavigationLink(destination: WordListView(title:"")) {
            Image(systemName: "plus")
                .font(.title)
                .padding()
                .foregroundColor(.white)
                .background(Color.orange)
                .cornerRadius(.infinity)
        }.shadow(radius: 6)
    }
    
}

struct AddChapter_Previews: PreviewProvider {
    static var previews: some View {
        AddChapter()
    }
}
