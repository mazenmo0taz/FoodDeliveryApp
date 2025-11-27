//
//  BottomButtons.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 27/11/2025.
//

import Foundation
import SwiftUI

struct BottomButtons: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        HStack(spacing: 20){
            Button{
                dismiss()
            }label: {
               Text( "Add items")
                .font(.headline)
                .frame(width: 110,height: 50)
                .padding()
                .modifier(CapsuleShapeModifier(color: .white, height:55))
                .modifier(StrokeLineModifier(lineWidth: 3, color: .black))
            }
            
            Button{
                
            }label: {
               Text( "Checkout")
                .font(.headline)
                .frame(width: 110,height: 50)
                .padding()
                .modifier(CapsuleShapeModifier(color: .orange, height:55))
                .modifier(StrokeLineModifier())
            }
        }
        .padding(.top)
    }
}
