//
//  ToolBarButtonStyle.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 17/11/2025.
//

import Foundation
import SwiftUI
struct ToolBarButtonLabel: View {
    var imageName: String
    var body: some View {
        ZStack {
            Circle()
                .stroke(.tertiary, lineWidth: 1)
                .background(Color.white)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .fontWeight(.semibold)
                .frame(width: 16,height: 16)
        }
    }
}
