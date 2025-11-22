//
//  AllRestaurantsView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 16/11/2025.
//

import SwiftUI

struct RestaurantsListView: View {
    var viewModel:RestaurantsViewModel
    var body: some View {
        ForEach(viewModel.restaurants.isEmpty ? RestaurantMockData.restaurants : viewModel.restaurants ,id: \.self){ restaurant in
                NavigationLink(value: restaurant){
                    RestaurantCell(restaurant: restaurant, viewModel: viewModel)
                }
            }
            .redacted(reason: viewModel.isDataLoading ? .placeholder : [])
    }
    
}



struct RestaurantCell: View {
    @State var restaurant:Restaurant
    var viewModel :RestaurantsViewModel
    var body: some View {
        HStack(spacing:18){
            if let image = viewModel.restaurantImages[restaurant.restaurantID] {
                ZStack(alignment: .topTrailing){
                    image
                        .resizable()
                        .frame(width:130,height: 110)
                        .scaledToFill()
                    Button{
                        restaurant.isFavorite.toggle()
                    }
                    label: {
                        Image(systemName: restaurant.isFavorite ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width:20, height:20)
                            .background(Color.black.opacity(0.5).frame(width:16,height:16).clipShape(Circle()))
                            .padding()
                            .tint(.white)
                            .bold()
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
                Text(restaurant.name)
                    .font(.title2)
                    .minimumScaleFactor(0.7)
                    .lineLimit(1)
                HStack(){
                    RestaurantRatingView(restaurant: restaurant)
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 5, height: 5)
                    Text("\(restaurant.timeToDeliver) mins")
                        .font(.caption)
                        .bold()
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 5, height: 5)
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
        HStack(spacing:5){
            
            Image(systemName:"star.fill")
                .resizable()
                .foregroundColor(.yellow)
                .scaledToFit()
                .frame(width: 20, height: 20)
            Text("\(restaurant.rating,specifier: "%.1f")")
                .font(.caption)
                .bold()
        }
    }
}

