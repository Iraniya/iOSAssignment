//
//  CarouselView.swift
//  iOSAssignment
//
//  Created by Iraniya Naynesh on 14/05/25.
//

import SwiftUI


// Main Carousel View
struct CarouselView: View {
    @StateObject var viewModel = CarouselViewModel()
    
    var body: some View {
        VStack {
            CarouselContentView(viewModel: viewModel)
            CarouselViewIndicator(viewModel: viewModel)
        }
    }
}


#Preview {
    CarouselView()
}
