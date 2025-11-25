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
                    //CartHeaderView()
                    CartItemsView(items: cartViewModel.items)
                    SpecialRequestView()
                    VoucherView()
                    
                    PaymentSummaryView()
                    
                    Spacer()
                    BottomButtons()
                }
                .padding()
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

struct CartHeaderView: View {
    var body: some View {
        HStack {
            Button(action: { /* Handle back navigation */ }) {
                Image(systemName: "arrow.left")
            }
            VStack(alignment: .leading) {
                Text("Cart").font(.title2).fontWeight(.bold)
                Text("5abzino").font(.caption).foregroundColor(.gray)
            }
            Spacer()
        }
    }
}

struct CartItemsView: View {
    var items: [CartItem]
    var body: some View {
        VStack(spacing: 16) {
            ForEach(items){ item in
                CartItemCell(cartItem: item)
                Divider()
            }
           
        }.padding(.vertical)
    }
}

struct SpecialRequestView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Special request")
                .font(.title2)
                .bold()
            Button{
                //viewModel.OrderNoteIsPresent = true
            }label: {
                CartNotesButtonLabel()
            }
        }.padding(.vertical)
    }
}


struct CartNotesButtonLabel: View {
@Environment(CartViewModel.self) var cartViewModel
    var body: some View {
        HStack(spacing:15){
            Image(systemName: "message")
                .font(.title2)
            
            VStack(alignment:.leading){
                Text("Any special requests?")
                if !cartViewModel.cartNote.isEmpty{
                    Text(cartViewModel.cartNote)
                    .font(.callout)
                    .lineLimit(3)
                    .foregroundStyle(.secondary)
                }
            }
            Spacer()
        }
        .frame(height: 25)
        .padding(.vertical)
        .frame(maxWidth: .infinity)
    }
}


struct VoucherView: View {
    @State private var voucherCode = ""
    var body: some View {
        VStack(alignment: .leading) {
            Text("Save on your order")
            .font(.title2)
            .bold()
            HStack {
                Image(systemName: "ticket")
                    .rotationEffect(.degrees(90))
                    .font(.title2)
                    .foregroundStyle(.secondary)
                TextField("Enter voucher code", text: $voucherCode)
                    .textFieldStyle(.plain)
                Text("Submit")
                    .foregroundStyle(.orange)
                    .font(.title3)
                    .bold()
            }
            .frame(height:30)
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                .stroke(.tertiary, lineWidth: 1)
            }
            .padding(.bottom)
        }
        .padding(.vertical)
    }
}

struct PaymentSummaryView: View {
    @Environment(CartViewModel.self) var cartViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Payment summary").font(.headline)
            HStack {
                Text("subtotal")
                Spacer()
                Text("\(cartViewModel.total)")
            }
            HStack {
                Text("Delivery fee")
                Spacer()
                Text("\(cartViewModel.RestaurantDeliveryFee)")
            }
            HStack {
                Text("Total amount").fontWeight(.bold)
                Spacer()
                Text("\(cartViewModel.RestaurantDeliveryFee + cartViewModel.total)").fontWeight(.bold)
            }
        }
        .padding(.vertical)
    }
}





struct BottomButtons: View {
    var body: some View {
        HStack(spacing: 20){
            Button{
                
            }label: {
               Text( "Add items")
                .font(.headline)
                .frame(width: 110,height: 50)
                .padding()
                .modifier(CapsuleShapeModifier(color: .white, height:55))
                .modifier(StrokeLineModifier(lineWidth: 3, color: .black))
            }
            
            Button{
                
            }label: {
               Text( "Checkout")
                .font(.headline)
                .frame(width: 110,height: 50)
                .padding()
                .modifier(CapsuleShapeModifier(color: .orange, height:55))
                .modifier(StrokeLineModifier())
            }
        }
        .padding(.top)
    }
}
