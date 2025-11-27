//
//  RestaurantCellView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 27/11/2025.
//

import Foundation
import SwiftUI

enum FavButtonPosition{
    case onImage
    case atCellTrailing
}

struct RestaurantCell: View {
    var restaurant:Restaurant
    var viewModel :RestaurantsViewModel
    var favoriteButtonPosition:FavButtonPosition = FavButtonPosition.onImage
    var body: some View {
        HStack(spacing:18){
            if let image = viewModel.restaurantImages[restaurant.restaurantID] {
                ZStack(alignment: .topTrailing){
                    image
                        .resizable()
                        .frame(width:130,height: 110)
                        .scaledToFill()
                        
                    if favoriteButtonPosition == .onImage{
                        if let index = viewModel.restaurants.firstIndex(of: restaurant){
                            AddTofavoriteButton(restaurant: restaurant){
                                viewModel.restaurants[index].isFavorite.toggle()
                            }
                        }
                    }
                        
                }
                .clipShape(RoundedRectangle(cornerRadius: 8))
            } else {
                Image("restaurantImagePH")
                    .resizable()
                    .foregroundStyle(.secondary)
                    .frame(width:130,height: 110)
            }
            VStack(alignment:.leading, spacing:10){
                HStack(){
                    Text(restaurant.name)
                        .font(.title2)
                        .minimumScaleFactor(0.7)
                        .lineLimit(1)
                    if favoriteButtonPosition == .atCellTrailing{
                        Spacer()
                        AddTofavoriteButton(restaurant: restaurant){
                            viewModel.restaurants[viewModel.restaurants.firstIndex(of: restaurant)!].isFavorite.toggle()
                        }
                    }
                }
               
                HStack{
                    
                    RestaurantRatingView(restaurant: restaurant)
                    CircleSeparetor()
                    Text("\(restaurant.timeToDeliver) mins")
                        .font(.caption)
                        .bold()
                    CircleSeparetor()
                    Text("EGP \(restaurant.deliveryFee)")
                        .font(.caption)
                        .bold()
                    
                }
                if restaurant.haveDiscount{
                    Text("15% off selected items")
                        .padding(8.0)
                        .font(.caption)
                        .bold()
                        .background(Color("OffersColor"))
                        .cornerRadius(10)
                }
            }
            Spacer()
        }
        .frame(maxHeight:130)
        .padding(.bottom,8)
        
    }
}

struct RestaurantRatingView: View {
    var restaurant: Restaurant
    
    var body: some View {
        HStack(spacing:0){
            Image(systemName:"star.fill")
                .resizable()
                .foregroundColor(.yellow)
                .scaledToFit()
                .frame(width: 18, height: 18)
                .padding(.trailing,3)
                Text("\(restaurant.rating,specifier: "%.1f")")
            
            Text("(999+)")
                    
                .foregroundStyle(.secondary)
            
           
         
        }
        .minimumScaleFactor(0.88)
        .lineLimit(1)
        .frame(maxWidth: .infinity)
        .font(.caption)
        .bold()
    }
}
