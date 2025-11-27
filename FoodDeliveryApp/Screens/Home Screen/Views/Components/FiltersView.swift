//
//  FiltersView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 16/11/2025.
//

import SwiftUI
enum Filters:String,CaseIterable,Identifiable{
    var id:Self{
        self
    }
    case Pickup = "Pickup"
    case offers = "Offers"
    case ratingAbove3 = "Rating 3.0+"
    case deliveryUnder50 = "Under 50 mins"
    case newlyAdded = "Newly Added"
}

struct FiltersView: View {
    var viewModel:RestaurantsViewModel
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
                }
                .modifier(CapsuleShapeModifier(color: .clear))
                .modifier(StrokeLineModifier())
                
                ForEach(Filters.allCases){ filter in
                    Text(filter.rawValue)
                        .font(.body)
                        .bold()
                        .modifier(CapsuleShapeModifier(color: .clear))
                        .frame(maxWidth: 200)
                        .modifier(StrokeLineModifier())
                        .onTapGesture {
                            viewModel.applyFilters(filter: filter, searchText: nil)
                        }
                }
            }
            .frame(maxHeight: 50)
        }
        .scrollIndicators(ScrollIndicatorVisibility.hidden)
    }
}
#Preview {
    FiltersView(viewModel: RestaurantsViewModel(service: BaseApi()))
}
