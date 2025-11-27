//
//  OrderAgainView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 17/11/2025.
//

import SwiftUI
struct OrderAgainView: View {
    var viewModel:RestaurantsViewModel
    
    var body: some View {
        VStack(alignment:.leading){
            Text("Order again")
                .font(.title2)
                .bold()
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing:12) {
                    ForEach(viewModel.restaurants.prefix(8)){ restaurant in
                        Group{
                            if viewModel.isImagesLoading{
                                ProgressView()
                                    .frame(width: 100)
                            }else if !viewModel.restaurants.isEmpty{
                                OrderAgainItem(image: viewModel.restaurantImages[restaurant.id] ?? Image("restaurantPlaceholderPH"), restaurant: restaurant)
                            }
                        }
                    }
                }
            }
            .frame(height:100)
        }
        .padding(.vertical,30)
    }
    
}

struct OrderAgainItem: View {
    let image: Image
    let restaurant: Restaurant

    var body: some View {
        NavigationLink(value: restaurant) {
            ZStack(alignment: .bottom) {
                image
                    .resizable()
                    .frame(width: 100)
                    .aspectRatio(contentMode: .fit)
                    .background(.gray)
                    .cornerRadius(10)

                Text(restaurant.name)
                    .foregroundColor(.white)
                    .padding(8)
                    .shadow(radius: 5)
                    .background(.black.opacity(0.5))
                    .font(.caption2)
                    .bold()
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                    .clipShape(Capsule())
            }
            .frame(width: 100)
        }
    }
}
