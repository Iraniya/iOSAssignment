//
//  CarouselViewModel.swift
//  iOSAssignment
//
//  Created by Iraniya Naynesh on 16/05/25.
//

import Foundation

// ViewModel managing current page state
class CarouselViewModel: ObservableObject {
    @Published var currentPage = 0
    var cards: [Card]
    
    init(cards: [Card] = CardsDataSource.allCards) {
        self.cards = cards
    }
    
    var totalPages: Int {
        return self.cards.count
    }
    
    var firstCard: Card {
        return self.cards.first ?? .init(imageName: "card1", title: "Card 1", subtitle: "Subtitle 1")
    }
}
