//
//  ContentView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 16/11/2025.
//

import SwiftUI

struct FoodScreen: View {
    @State private var viewModel = RestaurantsViewModel()
    @State private var searchText: String = ""
    var body: some View {
        NavigationStack {
            ScrollView(.vertical,showsIndicators: false){
                LazyVStack(pinnedViews:.sectionHeaders){
                    SearchBarView(searchText: $searchText)
                    PromosCardView(viewModel: viewModel)
                    OrderAgainView(viewModel: viewModel)
                    CategoriesView()
                    Section {
                        RestaurantsListView(viewModel: viewModel)
                            }
                     header: {
                        FiltersView()
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
                    .padding(.bottom,10)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Button{
                            print("open favs restaurant")
                        }label: {
                            ToolBarButtonLabel(imageName:"heart")
                        }
                        
                        Button{
                            print("open cart")
                        }label: {
                            ToolBarButtonLabel(imageName:"bag.fill")
                        }
                    }
                    .padding(.bottom,10)
                }
            }
            .task {
                await viewModel.getRestaurants()
            }
        }
        
    }
}

#Preview {
    FoodScreen()
}





