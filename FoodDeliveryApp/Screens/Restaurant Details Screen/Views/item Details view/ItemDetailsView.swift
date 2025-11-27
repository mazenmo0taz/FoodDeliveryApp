//
//  ItemDetailsView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 23/11/2025.
//

import SwiftUI

struct ItemDetailsView: View{
    @Bindable var viewModel:ItemDetailsViewModel
    var body: some View {
        Spacer()
        ZStack(alignment: .bottom){
            VStack(spacing:15){
                RemoteImageView(url: viewModel.item.imageUrl)
                .scaledToFill()
                .frame(maxWidth:.infinity,maxHeight: 300)
                .clipped()
                
                VStack(alignment:.leading,spacing:10) {
                    Text("Item Name")
                    .font(.title)
                    .fontWeight(.semibold)
                    
                    Text("Item Description")
                    .fontWeight(.semibold)
                    .bold()
                    .foregroundStyle(.secondary)
                
                    Button{
                        viewModel.OrderNoteIsPresent = true
                    }label: {
                        NotesButtonLabelView(viewModel: viewModel)
                    }
                    
                }
                .padding(.horizontal)
                
                AddItemView(viewModel: viewModel)
                .padding()
            }
            
            if viewModel.OrderNoteIsPresent {
                Color.black.opacity(0.6)
                .onTapGesture {
                    viewModel.OrderNoteIsPresent = false
                }
                
                NotesView(viewModel: viewModel, textFieldPlaceHolder: "" )
                .frame(height: 140)
                .padding(.bottom)
                .offset(x:0, y: -25)
            }
            
        }
        .frame(maxHeight: 530)
        
    }
    
}

#Preview {
    ItemDetailsView(viewModel: ItemDetailsViewModel(item: MenuItem(itemID: 1, itemName: "ddddd", itemDescription: "ssss", itemPrice: 2222, restaurantID: 2, imageUrl: "")))
        .environment(CartViewModel(RestaurantDeliveryFee: 0))
}


