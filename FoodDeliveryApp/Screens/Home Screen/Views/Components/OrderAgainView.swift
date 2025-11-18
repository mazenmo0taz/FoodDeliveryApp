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
                    ForEach(0..<8){ i in
                        if viewModel.isImagesLoading{
                            ProgressView()
                            .frame(width:100)
                        }else{
                            let promoImage = viewModel.restaurantImages.values.randomElement() ?? Image("restaurantImagePH")
                            ZStack(alignment: .bottom){
                                promoImage
                                    .resizable()
                                    .frame(width: 100)
                                    .aspectRatio(contentMode: .fit)
                                    .background(.gray)
                                    .cornerRadius(10)
                                
                                Text(viewModel.restaurants[i+1].name)
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
            }
            .frame(height:100)
        }
        .padding(.top,25)
        .padding(.bottom,10)
        
    }
}

    
