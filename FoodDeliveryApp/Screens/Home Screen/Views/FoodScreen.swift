//
//  ContentView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 16/11/2025.
//

import SwiftUI

struct FoodScreen: View {
    @Environment(CartViewModel.self) var cartViewModel
    @State private var viewModel = RestaurantsViewModel(service: BaseApi())
    @State private var searchText: String = ""
    var body: some View {
        NavigationStack {
            ScrollView(.vertical,showsIndicators: false){
                LazyVStack(pinnedViews:.sectionHeaders){
                    SearchBarView(searchText: $searchText, viewModel: viewModel)
                    PromosCardView(viewModel: viewModel)
                    OrderAgainView(viewModel: viewModel)
                    CategoriesView()
                    Section {
                        RestaurantsListView(viewModel: viewModel)
                    }
                     header: {
                        FiltersView(viewModel: viewModel)
                    }.padding(.vertical,10)
                        .background(Color.white)
                }
            }
            .padding(.leading)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    HStack(spacing:12){
                        ToolBarButtonLabel(imageName: "arrow.left")
                        Text("Deliver to Apartment")
                            .fontWeight(.bold)
                    }
                    .padding(.vertical,10)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        NavigationLink{
                            if !viewModel.isDataLoading{
                                FavoriteRestaurantsView(
                                    restaurants: viewModel.favoriteRestaurants,
                                    restaurant: viewModel.restaurants.randomElement()!
                                    ,
                                    viewModel: viewModel
                                )
                            }

                        }label: {
                            ToolBarButtonLabel(imageName:"heart")
                        }
                            
                        
                        
                        if cartViewModel.count > 0{
                    
                                NavigationLink{
                                    CartScreen()
                                }label: {
                                    ToolBarButtonLabel(imageName:"bag.fill")
                                }
                            
                        }
                       
                    }
                    .padding(.vertical,10)
                }
            }
            .task {
                await viewModel.getRestaurants()
                //viewModel.applyFilters(searchText: nil)
            }
            .navigationDestination(for: Restaurant.self){ (restaurant) in
                let restaurantDetailsVM = RestaurantDetailViewModel(restaurant: restaurant, MenuItems: viewModel.restaurantsMenuItems[restaurant.restaurantID] ?? [], restaurantImage: viewModel.restaurantImages[restaurant.restaurantID] ?? Image("restaurantImagePH"))
                RestaurantDetailView(viewModel: restaurantDetailsVM)
            }
          
        }
        
    }
}

#Preview {
    FoodScreen()
        .environment(CartViewModel(RestaurantDeliveryFee: 10))
}





