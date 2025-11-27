//
//  CartItemCell.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 24/11/2025.
//

import Foundation
import SwiftUI
struct CartItemCell: View {
    @Environment(CartViewModel.self) var cartViewModel
    var cartItem:CartItem
    @State private var quantity = 1

    var body: some View {
        HStack {
            VStack(alignment: .leading,spacing: 10) {
                Text(cartItem.item.itemName)
                .font(.title3)
                .bold()
                
                HStack {
                    Image(systemName: "pencil.line")
                    Text("Edit")
                    .underline()
                }
                .font(.body)
                .bold()
                .foregroundStyle(.orange)
    
                Spacer()
                Text("EGP \(cartItem.item.itemPrice)")
                    .font(.title3)
                .bold()
            }
            
            Spacer()
            
            ZStack(alignment: .bottom){
                RemoteImageView(url: cartItem.item.imageUrl)
                    .frame(maxWidth: 150, maxHeight: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                CustomStepperView(cartItemID: cartItem.id,quantity: cartItem.quantity,minusBtnImageString: quantity == 1 ? "trash" : "minus",minusBtnColorAtmin: .orange){
                    cartViewModel.removeFromCart(itemId: cartItem.id)
                } onPlus: {
                    cartViewModel.incrementItemQuantity(itemId: cartItem.id)
                }
                    .padding(.bottom,10)
            }
            
                
        }
        .frame(height: 140)
        .padding()
        
    }
        
}
