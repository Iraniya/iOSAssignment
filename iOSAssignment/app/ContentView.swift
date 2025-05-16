//
//  ContentView.swift
//  iOSAssignment
//
//  Created by Iraniya Naynesh on 13/05/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        VStack {
            Text("Iraniya Naynesh")
                .font(.headline)
            Spacer()
            
            CarouselView()
            
            Spacer()
            
            ForEach(0..<10) { _ in
                Text("Iraniya Naynesh")
                    .font(.headline)
            }
        }
    }
}

#Preview {
    ContentView()
}
