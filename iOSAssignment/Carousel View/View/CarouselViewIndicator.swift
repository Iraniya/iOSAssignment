//
//  CarouselViewIndicator.swift
//  iOSAssignment
//
//  Created by Iraniya Naynesh on 16/05/25.
//

import SwiftUI

// Indicator View showing dots
struct CarouselViewIndicator: View {
    @ObservedObject var viewModel: CarouselViewModel
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<viewModel.totalPages, id: \.self) { index in
                Circle()
                    .fill(index == viewModel.currentPage ? Color.black : Color.gray)
                    .frame(width: 8, height: 8)
            }
        }
        .padding(.top)
    }
}
