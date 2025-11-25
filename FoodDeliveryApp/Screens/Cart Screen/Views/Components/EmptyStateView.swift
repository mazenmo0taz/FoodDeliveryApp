//
//  EmptyStateView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 25/11/2025.
//

import Foundation
import SwiftUI
struct EmptyStateView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            VStack(spacing:10){
                Image(systemName: "exclamationmark.magnifyingglass")
                    .rotationEffect(.degrees(90))
                    .font(Font.system(size: 80, weight: .semibold))
                
                Text("there is nothing in your cart yet")
                    .font(.title2)
                    .bold()
                Text("Ready to order?")
                    .font(.title3)
                    .foregroundStyle(.secondary)
                    .bold()
                Button("Add items"){
                    dismiss()
                }
                .modifier(CapsuleShapeModifier())
                .modifier(StrokeLineModifier(lineWidth: 2,color: .black))
            }
        }
    }
}
#Preview {
    EmptyStateView()
}
