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
                ForEach(0..<7) { i in
                    let promoImage = Image("\(viewModel.offerImageName[i])")
                    ZStack(alignment: .topTrailing){
                        promoImage
                            .resizable()
                            .frame(width:130)
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
        }
        .frame(height:130)
        .padding(.top)
    }
}
