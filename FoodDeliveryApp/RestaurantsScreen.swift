//
//  ContentView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 16/11/2025.
//

import SwiftUI

struct RestaurantsScreen: View {
    @State private var searchText: String = ""
    var body: some View {
        NavigationStack {
            ScrollView(.vertical){
                SearchBarView(searchText: $searchText)
                PromosCardView()
                OrderAgainView()
                AllRestaurantsView()
             Spacer()
            }
            .padding()
            .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        HStack(spacing:12){
                            ToolBarItemsView(imageName: "arrow.left")
                            Text("Deliver to Apartment")
                                .fontWeight(.bold)
                        }
                        .padding(.bottom,10)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack {
                            Button{
                                
                            }label: {
                                ToolBarItemsView(imageName:"heart")
                            }
                            
                            Button{
                                
                            }label: {
                                ToolBarItemsView(imageName:"bag.fill")
                            }
                        }
                        .padding(.bottom,10)
                    }
                
            }
        
        }
        
    }
}

#Preview {
    RestaurantsScreen()
}

struct ToolBarItemsView: View {
    var imageName: String
    var body: some View {
        ZStack {
            Circle()
                .stroke(.tertiary, lineWidth: 1)
                .frame(width: 40, height: 40)
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .fontWeight(.semibold)
                .frame(width: 16,height: 16)
                
        }
    }
}
        

struct SearchBarView: View {
    @Binding var searchText: String
    var body: some View {
        HStack(spacing: 12){
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 17, height: 17)
                .foregroundColor(.secondary)
            TextField("Search for restaurants", text: $searchText)
                .onSubmit {
                    print(searchText)
                }
        }
        .modifier(CapsuleShapeModifier(color: .secondary.opacity(0.1)))
       
    }
}

struct PromosCardView: View {
    var body: some View {
        ScrollView(.horizontal){
            HStack(spacing:12){
                ForEach(0..<5){_ in
                    Rectangle()
                        .fill(.gray)
                        .frame(width: 140)
                        .cornerRadius(10)
                }
            }
        }
        .frame(height:140)
        .padding(.top)
        .scrollIndicators(ScrollIndicatorVisibility.hidden)
    }
}

struct OrderAgainView: View {
    var body: some View {
        VStack(alignment:.leading){
            Text("Order again")
                .font(.title2)
                .bold()
            ScrollView(.horizontal){
                HStack(spacing:12) {
                    ForEach(0..<5){_ in
                        Image("square.and.arrow.up.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .background(.gray)
                            .cornerRadius(10)
                    }
                }
            }
            .frame(height:100)
            .scrollIndicators(ScrollIndicatorVisibility.hidden)
        }
        .padding(.top,25)
    }
}

