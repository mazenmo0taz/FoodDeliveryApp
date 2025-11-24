//
//  MenuItemCell.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 19/11/2025.
//

import Foundation
import SwiftUI

struct MenuItemCell: View {
    let item: MenuItem
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            VStack(alignment: .leading, spacing: 6) {
                Text(item.itemName)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.black)

                Text(item.itemDescription)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .lineLimit(2)

                Text("EGP \(item.itemPrice)")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.black)
                    .padding(.top, 4)
            }
            Spacer()
            RemoteImageView(url: item.imageUrl)
            .frame(width: 95, height: 95)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding(.vertical, 12)
        .overlay(alignment:.bottom){
            Divider().offset(y: 12)
        }
        .padding(.horizontal)
    }
}
