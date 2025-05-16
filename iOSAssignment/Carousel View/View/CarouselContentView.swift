//
//  CarouselContentView.swift
//  iOSAssignment
//
//  Created by Iraniya Naynesh on 16/05/25.
//

import SwiftUI

struct CarouselContentView: View {
    @ObservedObject var viewModel: CarouselViewModel
    
    @State private var hasScrolled = false
    @State private var scrollOffset: CGFloat = 0
    //@State private var spacing: CGFloat = 0
    var body: some View {
        GeometryReader { geometry in
            let cardWidth = geometry.size.width * 0.8
            let spacing = -((geometry.size.width/2) * 0.2)
            //let spacing: CGFloat = spacing //-((geometry.size.width * 0.2) / 2)
            let totalWidth = cardWidth + spacing
            
            ScrollViewReader { scrollProxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: spacing) {
                        ForEach(Array(viewModel.cards.enumerated()), id: \.element) { index, card in
                            CardView(card: card)
                                .zIndex(viewModel.currentPage == index ? 1 : 0)
                                .frame(width: cardWidth)
                                // Capture the position of each card
                                .background(
                                    GeometryReader { geo in
                                        Color.clear
                                            .preference(key: ViewOffsetKey.self, value: geo.frame(in: .global).midX)
                                    }
                                )
                                .onPreferenceChange(ViewOffsetKey.self) { midX in
                                    // This is to detect if this card is in the middle
                                    let screenMidX = geometry.size.width / 2
                                    if abs(midX - screenMidX) < totalWidth / 2 {
                                         //spacing = max(abs(midX - screenMidX), 0)
                                        // Update current page
                                        if viewModel.currentPage != index {
                                            DispatchQueue.main.async {
                                                viewModel.currentPage = index
                                                //spacing = 0
                                            }
                                        }
                                    }
                                }
                                .scrollTransition { content, phase in
                                    content
                                        .scaleEffect(y: phase.isIdentity ? 1 : 0.8)
                                        .scaleEffect(x: phase.isIdentity ? 1 : 0.8)
                                }
                            
                        }
                    }
                    .padding(.horizontal, geometry.size.width * 0.1)
                }
                .onAppear {
                    if !hasScrolled {
                        // Initial position at middle
                        scrollProxy.scrollTo(viewModel.currentPage, anchor: .center)
                        hasScrolled = true
                    }
                }
            }
        }
    }
}


// Preference key for capturing offset
struct ViewOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
