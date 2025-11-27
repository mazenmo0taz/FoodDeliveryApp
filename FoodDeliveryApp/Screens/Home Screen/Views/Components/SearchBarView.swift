//
//  SearchBarView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 17/11/2025.
//

import Foundation
import SwiftUI
struct SearchBarView: View {
    @Binding var searchText: String
    var viewModel: RestaurantsViewModel
    var body: some View {
        HStack(spacing: 12){
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 17, height: 17)
                .foregroundColor(.secondary)
            TextField("Search for restaurants", text: $searchText)
                .onChange(of: searchText) {
                    viewModel.applyFilters(searchText:searchText)
                }
        }
        .modifier(CapsuleShapeModifier(color: .secondary.opacity(0.1)))
        .padding(.trailing,12)
    }
}
