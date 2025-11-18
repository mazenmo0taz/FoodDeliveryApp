//
//  PromosView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 17/11/2025.
//
import SwiftUI
struct PromosCardView: View {
    let viewModel: RestaurantsViewModel
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing:12){
            if viewModel.isImagesLoading{
                    ForEach(0..<8) { i in
                        ProgressView()
                            .frame(width:130)
                    }
                    .padding(.top)
                }else{
                    
                    ForEach(0..<8) { i in
                        let promoImage = viewModel.restaurantImages.values.randomElement() ?? Image("restaurantImagePH")
                        ZStack(alignment: .topTrailing){
                            promoImage
                                .resizable()
                                .frame(width:130)
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .overlay(
                                    Text(viewModel.offersMockData.randomElement()!)
                                        .padding()
                                        .frame(width:130,height: 140)
                                        .background(Color.black.opacity(0.5))
                                        .foregroundStyle(Color("OffersColor"))
                                        .minimumScaleFactor(0.5)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                )
                       }
                    }
                }
                
            }
        }
        .frame(height:140)
        .padding(.top)
    }
}
