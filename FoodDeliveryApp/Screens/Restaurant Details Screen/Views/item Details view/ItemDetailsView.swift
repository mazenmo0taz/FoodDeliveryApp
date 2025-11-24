//
//  ItemDetailsView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 23/11/2025.
//

import SwiftUI

struct ItemDetailsView: View {
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
                
                NotesView(viewModel: viewModel )
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
        .environment(CartViewModel())
}

struct NotesButtonLabelView: View {
    var viewModel: ItemDetailsViewModel
    var body: some View {
        HStack(spacing:15){
            Image(systemName: "message")
                .font(.title2)
            
            VStack(alignment:.leading){
                Text("Any special requests?")
                if !viewModel.orderNote.isEmpty{
                    Text(viewModel.orderNote)
                    .font(.callout)
                    .lineLimit(3)
                    .foregroundStyle(.secondary)
                }
            }
            Spacer()
            
            Text(viewModel.orderNote.isEmpty ? "Add note" : "Edit")
            .bold()
            .underline()
            .padding(.trailing,7)
        }
        .frame(height: 25)
        .padding(.vertical)
        .frame(maxWidth: .infinity)
    }
}
