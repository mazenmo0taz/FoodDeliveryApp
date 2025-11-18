//
//  CategoriesView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 16/11/2025.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        
        ScrollView(.horizontal,showsIndicators: false){
            LazyHStack(spacing:15) {
                ForEach(CategsMockData.categories){ categorie in
                    VStack {
                        ZStack{
                            Circle()
                                .fill(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                            Image(systemName: "pencil.tip.crop.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width:60, height:60)
                        }
                        Text(categorie.name)
                            .font(.callout)
                            .bold()
                    }
                    .frame(width: 80)
                }
            }
        }
        .frame(height:120)
    }
}

#Preview {
    CategoriesView()
}
