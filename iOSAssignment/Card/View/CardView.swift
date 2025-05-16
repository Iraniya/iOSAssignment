//
//  CardView.swift
//  iOSAssignment
//
//  Created by Iraniya Naynesh on 13/05/25.
//

import SwiftUI

struct CardView: View {
    let card: Card
    let colors: [Color] = [Color.gray, Color.green, Color.black, Color.pink, Color.pink]
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(card.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                
                VStack {
                    HStack {
                        Spacer()
                        ZStack {
                            Circle()
                                .frame(width: 40, height: 40)
                                .foregroundStyle(Color.white)
                                .shadow(radius: 5)
                            Image("verified")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        }
                        .padding()
                    }
                    Spacer()
                } //Verified Icon End here
                
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Spacer()
                        Text(card.title)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .padding(.leading)
                        
                        Text(card.subtitle)
                            .font(.caption)
                            .foregroundStyle(.white)
                            .padding(5)
                            .background(Color.blue)
                            //.cornerRadius(8)
                        
                    }
                    .padding(.bottom, 16)
                    Spacer()
                }
                
                //Color(colors.randomElement() ?? .red)
            }
            .cornerRadius(20)
        }
    }
}

#Preview {
    let card = Card(imageName: "card1",
                    title: "Thailand",
                    subtitle: "32K+ Visas on Atlys")
    CardView(card: card)
    .frame(width: 250, height: 400, alignment: .center)
    .padding()
}
