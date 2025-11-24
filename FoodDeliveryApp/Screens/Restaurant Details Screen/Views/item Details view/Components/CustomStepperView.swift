//
//  CustomStepperView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 24/11/2025.
//

import SwiftUI
struct CustomStepperView: View {
    @Binding var itemCount: Int
    var min = 1
    var max = 10
    var minusBtnImageString = "minus"
    var minusBtnColorAtmin = Color.gray
    var minusBtnColor = Color.orange
    var body: some View {
        HStack {
            Button{
                if itemCount > min { itemCount -= 1 }
            }label: {
                Image(systemName: minusBtnImageString)
                    .foregroundColor(itemCount == min ? minusBtnColorAtmin : minusBtnColor)
                    .font(.title3)
                    .bold()
            }
            Text("\(itemCount)")
                .bold()
                .foregroundColor(.black)
                .padding()
            
            Button{
                if itemCount < max { itemCount += 1 }
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
