//
//  Modifiers.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 16/11/2025.
//
import SwiftUI
struct CapsuleShapeModifier: ViewModifier {
    var color: Color = .white
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(height: 45)
            .background(color)
            .clipShape(Capsule())
    }
}

struct StrokeLineModifier: ViewModifier {
    var lineWidth: CGFloat = 1
    func body(content: Content) -> some View {
        content
            .overlay {
                Capsule()
                .stroke(.tertiary, lineWidth: lineWidth)
            }
    
    }
}
