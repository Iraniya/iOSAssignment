//
//  CardView.swift
//  iOSAssignment
//
//  Created by Iraniya Naynesh on 13/05/25.
//

import SwiftUI

struct CardView: View {
    var imageName: String
    var countryName: String
    var info: String
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CardView(imageName: AppImage.logoFrance.rawValue,
             countryName: "France",
             visaInfo: "20K+ Visas on Atlys")
    .frame(width: 250, height: 250, alignment: .center)
    .padding()
}
