//
//  ViewCartButton.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 25/11/2025.
//

import Foundation
import SwiftUI

struct ViewCartButton: View {
@Environment(CartViewModel.self) var cartViewModel
    var body: some View {
        ZStack{
            HStack(spacing: 0){
                Circle()
                    .fill(.black.opacity(0.3))
                    .frame(width: 40, height: 40)
                    .overlay(
                        Text("\(cartViewModel.count)")
                            
                    )
                    .padding()
                Text("View cart")
                Spacer()
                Text("EGP \(cartViewModel.total)")
                    .padding(.trailing)
            }
            .background(.orange)
            
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .clipShape(Capsule())
            .padding(.horizontal)
            .padding(.top,25)
            .foregroundStyle(.white)
            .font(.title3)
            .fontWeight(.heavy)
        }
        .frame(height: 70)
        .background(.white)
    }
}
