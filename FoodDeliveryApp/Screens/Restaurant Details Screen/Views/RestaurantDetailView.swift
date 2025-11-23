//
//  RestaurantDetailView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 16/11/2025.
//

import SwiftUI

struct RestaurantDetailView: View {
    var viewModel:RestaurantDetailViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
            ScrollView {
                LazyVStack{
                    if viewModel.menuItems.indices.contains(1){
                        RemoteImageView(url: viewModel.menuItems[1].imageUrl)
                            .frame(height: 200)
                            .scaledToFit()
                    }else{
                        Rectangle()
                            .fill(Color.gray)
                            .frame(height: 200)
                            .scaledToFit()
                    }
                    
                    RestaurantInfoCard(viewModel: viewModel)
                    .padding(.horizontal)
                    .offset(y: -20)
                    
                    PromoBannersView(viewModel: viewModel)
                    MenuTabBar(viewModel: viewModel)
                        .padding(.vertical, 10)
                    PicksForYouView(viewModel: viewModel)
                    ForEach(viewModel.menuItems,id: \.itemID){ item in
                        MenuItemCell(item: item)
                    }
                }
                .redacted(reason: viewModel.isDataloading ? .placeholder : [])
            }
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea(edges: .top)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        dismiss()
                    }label: {
                        ToolBarButtonLabel(imageName: "arrow.left")
                    }
                        .padding(.vertical,10)
                }
                
                
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 0){
                        Button{
                            print("open favs restaurant")
                        }label: {
                            ToolBarButtonLabel(imageName:"heart")
                        }
                        
                        Button{
                            print("open cart")
                        }label: {
                            ToolBarButtonLabel(imageName:"square.and.arrow.up")
                        }
                        Button{
                            print("open cart")
                        }label: {
                            ToolBarButtonLabel(imageName:"magnifyingglass")
                        }
                    }
                    
                    .padding(.vertical,10)
                }
            }
        
        
        
        
    }
}

#Preview {
    RestaurantDetailView(viewModel: RestaurantDetailViewModel())
}





