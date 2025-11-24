//
//  AddItemView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 24/11/2025.
//

import Foundation
import SwiftUI
struct AddItemView: View {
    @State var viewModel:ItemDetailsViewModel
    @Environment(CartViewModel.self) var cartViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        HStack(spacing: 15) {
            CustomStepperView(itemCount: $viewModel.itemCount)
            Button{
                cartViewModel.addToCart(item: viewModel.item, quantity: viewModel.itemCount, note: viewModel.orderNote)
                dismiss()
            }label: {
                HStack {
                    Text("Add item")
                    .font(.system(size: 18, weight: .bold))
                    
                    Spacer()
                    
                    Text("EGP \(viewModel.item.itemPrice)")
                    .font(.system(size: 18, weight: .bold))
                }
                .foregroundColor(.white)
                .padding(.horizontal)
            }
            .frame(height: 50)
            .background(Color.orange)
            .clipShape(Capsule())
        }
        
    }
}


