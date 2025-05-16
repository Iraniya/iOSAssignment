//
//  Card.swift
//  iOSAssignment
//
//  Created by Iraniya Naynesh on 14/05/25.
//

import Foundation

struct Card: Identifiable, Hashable {
    let id = UUID()
    let imageName: String
    let title: String
    let subtitle: String
}

struct CardsDataSource {
    static let allCards: [Card] = [
        .init(imageName: "card1", title: "Card 1", subtitle: "Subtitle 1"),
        .init(imageName: "card2", title: "Card 2", subtitle: "Subtitle 2"),
        .init(imageName: "card3", title: "Card 3", subtitle: "Subtitle 3")
    ]
}
