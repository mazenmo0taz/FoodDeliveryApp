//
//  FiltersView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 16/11/2025.
//

import SwiftUI


struct FiltersView: View {
    var body: some View {
        ScrollView(.horizontal){
            LazyHStack(spacing:12) {
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
#Preview {
    FiltersView()
}
