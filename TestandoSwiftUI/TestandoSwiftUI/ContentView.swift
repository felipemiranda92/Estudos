//
//  ContentView.swift
//  TestandoSwiftUI
//
//  Created by Felipe Miranda Santos on 04/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack() {
            
            Color.purple
            VStack(alignment: .center, spacing: 10.0) {
                
                HStack {
                    Text("Felipe")
                        .background(.yellow)
                    Text("Miranda")
                        .background(.green)
                }
                
                Text("32 anos")
                    .background(.orange)
            }
            .background(.black)
        }

    }
}

#Preview {
    ContentView()
}
