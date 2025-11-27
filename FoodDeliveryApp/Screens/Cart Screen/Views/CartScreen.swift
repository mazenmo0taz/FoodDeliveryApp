//
//  CartScreen.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 16/11/2025.
//

import SwiftUI

struct CartScreen: View {
@Environment(CartViewModel.self) var cartViewModel
    var body: some View {
        ZStack{
            ScrollView(showsIndicators: false){
                LazyVStack(spacing: 0) {
                    CartItemsView(items: cartViewModel.items)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Special request")
                            .font(.title2)
                            .bold()
                        Button{
                            cartViewModel.orderNotesViewShown.toggle()
                        }label: {
                            NotesButtonLabelView(viewModel: cartViewModel)
                        }
                    }
                    .padding(.vertical)
                     
                    VoucherView()
                    
                    PaymentSummaryView()
                    
                    Spacer()
                    BottomButtons()
                }
                .padding()
            }
           
            if cartViewModel.orderNotesViewShown {
                Color.black.opacity(0.6)
                .onTapGesture {
                    cartViewModel.orderNotesViewShown = false
                }
                NotesView(viewModel: cartViewModel, textFieldPlaceHolder: "Anything else we need to know?")
                .frame(height: 140)
                .padding(.bottom)
                .offset(x:0, y: -25)
            }
            
            if cartViewModel.items.isEmpty {
                EmptyStateView()
            }
        }
    }
}

#Preview {
    CartScreen()
        .environment(CartViewModel(RestaurantDeliveryFee: 0))
}











