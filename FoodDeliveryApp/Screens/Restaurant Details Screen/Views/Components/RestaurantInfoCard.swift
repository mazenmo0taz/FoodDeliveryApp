//
//  RestaurantInfoCard.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 19/11/2025.
//

import SwiftUI
struct RestaurantInfoCard: View {
    let viewModel: RestaurantDetailViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top) {
                if let image = viewModel.restaurantImage{
                    image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                }else{
                    Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 60, height: 60)
                    .cornerRadius(8)
                    .background(Color.white)
                    
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(viewModel.restaurant!.name)
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    
//                    Text(restaurant.cuisineTypes.joined(separator: " , "))
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
                    
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .font(.caption)
                            .foregroundColor(.orange)
                        
                        Text("\(viewModel.restaurant!.rating, specifier: "%.1f")")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("(\(Int.random(in: 100...10000))+)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.leading, 8)
            }.padding(.bottom,10)
            
           
            
            HStack(spacing: 13) {
                HStack(spacing: 4) {
                    Image(systemName: "clock")
                        .font(.caption)
                    Text("\(viewModel.restaurant!.timeToDeliver) mins")
                        .font(.caption)
                }
                
                Circle()
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: 3, height: 3)
                
                HStack(spacing: 4) {
                    Image(systemName: "motorcycle")
                        .font(.caption2)
                    Text("EGP \(viewModel.restaurant!.deliveryFee)")
                        .font(.caption)
                }
                
                Circle()
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: 3, height: 3)
                
                HStack(spacing: 4) {
                    Text("Delivered by restaurant")
                        .font(.caption)
                        
                    
                    Image(systemName: "info.circle")
                        .font(.caption)
                }
            }
            
            .minimumScaleFactor(0.7)
            .lineLimit(1)
            .foregroundColor(.primary)
            .fontWeight(.medium)
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 2)
        
    }
}
