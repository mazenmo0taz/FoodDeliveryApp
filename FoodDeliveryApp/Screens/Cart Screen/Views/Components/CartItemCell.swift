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
    let name: String
    let image: String
    let price: String
    let original: String
    @State private var quantity = 1

    var body: some View {
        HStack {
            VStack(alignment: .leading,spacing: 10) {
                Text(name)
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
                Text(price)
                    .font(.title3)
                .bold()
            }
            
            Spacer()
            
            ZStack(alignment: .bottom){
                Image("restaurantImagePH")
                    .resizable()
                    .frame(maxWidth: 150, maxHeight: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                CustomStepperView(itemCount: $quantity,minusBtnImageString: quantity == 1 ? "trash" : "minus",minusBtnColorAtmin: .orange)
                    .padding(.bottom,10)
            }
            
                
        }
        .frame(height: 140)
        .padding()
        
    }
        
}
