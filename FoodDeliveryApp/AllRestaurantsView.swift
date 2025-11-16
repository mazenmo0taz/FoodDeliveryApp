//
//  AllRestaurantsView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 16/11/2025.
//

import SwiftUI

struct AllRestaurantsView: View {
        var body: some View {
            VStack(alignment:.leading,spacing:24){
                
                Text("All Restaurants")
                    .font(.title2)
                    .fontWeight(.semibold)
                
               CategoriesView()
                
                FiltersView()
                
                HStack {
                    Image(systemName: "square.fill")
                        .resizable()
                        .foregroundStyle(.primary)
                        .frame(width:150,height: 130)
                        .overlay(alignment: .topTrailing) {
                            Button{
                                print("added to favorites")
                            }
                                label: {
                                Image(systemName: "heart")
                                        .resizable()
                                        .frame(width:22, height:22)
                                        .padding()
                                        .tint(.white)
                                        .bold()
                            }
                        }
                    
                    VStack(alignment:.leading, spacing:10){
                        Text("Restaurant Name")
                            .font(.title2)
                        HStack(){
                            Label("4 (999+) .",systemImage: "star")
                                .font(.caption)
                                .bold()
                            Text("60 mins .")
                                .font(.caption)
                                .bold()
                            Text("EGP 50")
                                .font(.caption)
                                .bold()
                        }
                        Text("15% off")
                            .padding(8)
                            .font(.caption)
                            .bold()
                            .background(Color.red)
                            .cornerRadius(10)
                            
                    }
                }
                .frame(maxHeight:130)
                
            }
            
        }
}

#Preview {
    AllRestaurantsView()
}

struct CategoriesView: View {
    var body: some View {
        ScrollView(.horizontal){
            HStack(spacing:15) {
                ForEach(0..<5){_ in
                    VStack {
                        Circle()
                            .fill(Color.gray)
                            .cornerRadius(10)
                            .overlay(
                                Image(systemName: "pencil.tip.crop.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:75, height:75)
                            )
                        Text("Categorie")
                            .font(.callout)
                            .bold()
                    }
                    .frame(width:90)
                }
            }
        }
        .frame(height:120)
        .scrollIndicators(ScrollIndicatorVisibility.hidden)
    }
}

struct FiltersView: View {
    var body: some View {
        ScrollView(.horizontal){
            
            HStack(spacing:12) {
                
                Button{
                    print("Sort by")
                }label: {
                    HStack {
                        Image(systemName: "arrow.up.arrow.down")
                        Text("Sort by")
                            .font(.body)
                            .bold()
                        Image(systemName: "arrow.down")
                    }
                    .frame(height:35)
                }
                .modifier(CapsuleShapeModifier(color: .clear))
                .modifier(StrokeLineModifier())
                
                ForEach(0..<5){_ in
                    Text("Filter")
                        .font(.body)
                        .bold()
                        .padding(12)
                        .modifier(CapsuleShapeModifier(color: .clear))
                        .frame(maxWidth: 200)
                        .modifier(StrokeLineModifier())
                }
            }
            .frame(maxHeight: 50)
            
        }
        .scrollIndicators(ScrollIndicatorVisibility.hidden)
    }
}
