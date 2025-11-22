//
//  CategoriesView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 16/11/2025.
//

import SwiftUI

struct CategoriesView: View {
    let categoriesImages: [String:String] = [
        "Fast Food":"IMG_1720",
        "Dessert":"IMG_1721",
        "Drinks":"IMG_1722",
        "Beverages":"IMG_1724",
        "Snacks":"IMG_1723",
        "Meat":"IMG_1725",
        "Seafood":"IMG_1726"
    ]
    
    var body: some View {
        VStack(alignment:.leading,spacing: 15) {
            Text("All Restaurants")
                .font(.title2)
                .fontWeight(.semibold)
            ScrollView(.horizontal,showsIndicators: false){
                LazyHStack(spacing:15) {
                    ForEach(Array(categoriesImages.keys),id: \.self){ key in
                        VStack {
                            ZStack{
                                Image("\(categoriesImages[key]!)")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width:75, height:75)
                                    .shadow(radius: 8)
                                    .clipShape(Circle())
                            }
                            Spacer()
                            Text(key)
                                .font(.callout)
                                .bold()
                        }
                        .frame(width: 90)
                    }
                }
            }
            .frame(height:110)
            .padding(.vertical,10)
        }
        
    }
}

#Preview {
    CategoriesView()
}
