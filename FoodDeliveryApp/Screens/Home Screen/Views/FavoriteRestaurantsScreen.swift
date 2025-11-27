//
//  FavoriteRestaurantsScreen.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 27/11/2025.
//

import SwiftUI

struct FavoriteRestaurantsView: View {
    var restaurants: [Restaurant]
    var restaurant: Restaurant
    var viewModel: RestaurantsViewModel
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                HStack(spacing: 5){
                    Text("\(restaurants.count)")
                    .foregroundColor(.orange)
                    Text(" favorite restaurants in your area")
                }
                .font(.subheadline)
                .bold()
                .padding(.top, 4)

                AddtoFavPromoCrad

                ForEach(restaurants) { restaurant in
                    RestaurantCell(restaurant: restaurant, viewModel: viewModel,favoriteButtonPosition:.atCellTrailing)
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 24)
            .padding(.top, 8)
        }
    
    .navigationTitle("Favorites")
    .navigationBarTitleDisplayMode(.inline)
    }


    private var AddtoFavPromoCrad: some View {
        
        VStack(alignment: .leading, spacing: 12) {
            Text("Add to favorites")
                .font(.headline)
                .foregroundColor(.primary)

            Text("Save your favorite places and enjoy customized recommendations, just for you.")
                .font(.subheadline)
                .foregroundColor(.primary)

            ZStack(alignment: .topTrailing) {
                RemoteImageView(url: restaurant.image)
                    .scaledToFill()
                    .frame(height: 180)
                    .clipped()
                    .cornerRadius(16)

                Image(systemName: "heart.fill")
                    .foregroundColor(.orange)
                    .padding(12)
            }

            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 12) {
                    Text(restaurant.name)
                        .font(.headline)

                        RestaurantRatingView(restaurant: restaurant )
                    

                    HStack{
                        Image(systemName: "stopwatch")
                        Text(restaurant.timeToDeliver.description)
                        CircleSeparetor()
                        Image(systemName: "motorcycle")
                           
                        Text(restaurant.deliveryFee.description)
                            
                    }
                    .bold()
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }

                Spacer()
            }
        }
        .padding(16)
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.06), radius: 10, x: 0, y: 4)
    }
}


#Preview {
    FavoriteRestaurantsView(restaurants: [Restaurant(restaurantID: 1, name: "dd", image: "", rating: 22, timeToDeliver: 22, deliveryFee: 22, haveDiscount: true, isFavorite: true)],restaurant: Restaurant(restaurantID: 1, name: "dd", image: "", rating: 22, timeToDeliver: 22, deliveryFee: 22, haveDiscount: true, isFavorite: true),viewModel: RestaurantsViewModel(service: BaseApi()))
}
