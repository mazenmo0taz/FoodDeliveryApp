//
//  CustomStepperView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 24/11/2025.
//

import SwiftUI
struct CustomStepperView: View {
    @Environment(CartViewModel.self) var cartViewModel
    var cartItemID:Int
    var min = 1
    var max = 10
    var quantity: Int 
    var minusBtnImageString = "minus"
    var minusBtnColorAtmin = Color.gray
    var minusBtnColor = Color.orange
    var onMinus: () -> Void
    var onPlus: () -> Void
    var body: some View {
       
        HStack {
            Button{
                onMinus()
                
               // cartViewModel.removeFromCart(itemId: cartItemID)
            }label: {
                Image(systemName: minusBtnImageString)
                    .foregroundColor( quantity == min ? minusBtnColorAtmin : minusBtnColor)
                    .font(.title3)
                    .bold()
            }
            Text("\(quantity)")
                .bold()
                .foregroundColor(.black)
                .padding()
            
            Button{
                onPlus()
                // cartViewModel.incrementItemQuantity(itemId: cartItemID)
            }label: {
                Image(systemName: "plus")
                .font(.title3)
                .bold()
                .foregroundColor(.orange)
            }
        }
        .frame(width: 130, height: 50)
       
        .modifier(StrokeLineModifier(color: .white))
    }
}
