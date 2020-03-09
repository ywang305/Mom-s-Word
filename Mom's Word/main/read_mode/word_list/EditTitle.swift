//
//  EditTitle.swift
//  Mom's Word
//
//  Created by yao on 3/9/20.
//  Copyright © 2020 yao. All rights reserved.
//

import SwiftUI

struct EditTitle: View {
    @Binding var isOn: Bool
    @Binding var title: String
    var body: some View {
        Toggle(isOn: $isOn) {
            Image(systemName: "square.and.pencil")
            if self.isOn {
                TextField("Enter List Title", text: $title).textFieldStyle(RoundedBorderTextFieldStyle())
            } else {
                Text("Edit Title")
            }
            
        }.padding()
    }
}


struct EditTitle_Previews: PreviewProvider {
    @State static var editing = true
    @State static var title = "sxxx"
    static var previews: some View {
        EditTitle(isOn: $editing, title: $title)
    }
}
