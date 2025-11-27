//
//  VoucherView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 27/11/2025.
//

import Foundation
import SwiftUI

struct VoucherView: View {
    @State private var voucherCode = ""
    var body: some View {
        VStack(alignment: .leading) {
            Text("Save on your order")
            .font(.title2)
            .bold()
            HStack {
                Image(systemName: "ticket")
                    .rotationEffect(.degrees(90))
                    .font(.title2)
                    .foregroundStyle(.secondary)
                TextField("Enter voucher code", text: $voucherCode)
                    .textFieldStyle(.plain)
                Text("Submit")
                    .foregroundStyle(.orange)
                    .font(.title3)
                    .bold()
            }
            .frame(height:30)
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                .stroke(.tertiary, lineWidth: 1)
            }
            .padding(.bottom)
        }
        .padding(.vertical)
    }
}
