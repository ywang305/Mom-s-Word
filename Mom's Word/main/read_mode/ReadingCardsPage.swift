//
//  ReviewCardPage.swift
//  eb_sui_4_abs
//
//  Created by yao on 2/24/20.
//  Copyright © 2020 yao. All rights reserved.
//

import SwiftUI

struct ReadingCardsPage: View {
    @ObservedObject private var keyboard = KeyboardResponder()
    
    var body: some View {
        NavigationView {
            VStack{
                Spacer()
                CardStack()
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(destination: WordListPage()) {
                        Image(systemName: "list.dash")
                            .resizable()
                            .frame(width: 30, height: 20, alignment: .center)
                    }
                }.padding(.bottom, 12)
                
                AddWord()
                    .modifier(ResponsivePadding(keybordHeight: keyboard.currentHeight))
            }.padding()
            
        }
    }
}

struct ReadingCardsPage_Previews: PreviewProvider {
    static var previews: some View {
        ReadingCardsPage()
    }
}
