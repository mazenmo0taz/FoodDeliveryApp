//
//  PicksForYouView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 19/11/2025.
//
import SwiftUI
struct PicksForYouView: View {
    var viewModel:RestaurantDetailViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Picks for you")
            .font(.title3)
            .fontWeight(.bold)
            .padding(.horizontal)
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 10) ,count: 2)) {
                ForEach(0..<6) { i in
                    if i < viewModel.menuItems.count{
                         PicksFuItemCard(item: viewModel.menuItems[i])
                            .padding(.bottom,8)
                    }else{
                        PicksFuItemCard(item: viewModel.menuItems[i-viewModel.menuItems.count])
                           .padding(.bottom,8)
                    }
                }
            }
            .padding(.vertical,15)
        }
       
       
        
    }
        
}

struct PicksFuItemCard: View {
    let item: MenuItem

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RemoteImageView(url: item.imageUrl)
                .scaledToFill()
                .frame(width: 160, height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .cornerRadius(12)
            
            Text(item.itemName)
                .font(.subheadline)
                .fontWeight(.medium)
                .lineLimit(2)
            
            
            Text("EGP \(item.itemPrice)")
                .font(.subheadline)
                .fontWeight(.semibold)
            
        }
        .frame(width: 160)
    }
}

struct PickFuPlaceHolder:View{
    var body: some View{
       
        VStack(alignment: .leading, spacing: 8) {
            Image("restaurantImagePH")
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.bottom,8)
                .overlay(
                    ProgressView()
                )
            
            Text("item name")
                .font(.subheadline)
                .fontWeight(.medium)
                .lineLimit(2)
            
            
                Text("EGP 100")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            
        }
        .frame(width: 160)
    }
}
