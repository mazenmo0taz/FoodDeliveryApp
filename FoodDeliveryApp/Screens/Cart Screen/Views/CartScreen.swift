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
        VStack(spacing: 0) {
            CartHeaderView()
            CartItemsView()
            SpecialRequestView()
            VoucherView()

            PaymentSummaryView()
            
            Spacer()
            BottomButtons()
        }
        .padding()
//        .sheet(isPresented: ){
//            NotesView(viewModel: viewModel )
//            .frame(height: 140)
//            .padding(.bottom)
//        }
    }
}

#Preview {
    CartScreen()
        .environment(CartViewModel())
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
    var body: some View {
        VStack(spacing: 16) {
            CartItemCell(
                name: "V7",
                image: "can",
                price: "EGP 27.12",
                original: "EGP 31.90"
            )
            Divider()
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
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Payment summary").font(.headline)
            HStack {
                Text("Subtotal")
                Spacer()
                Text("EGP 43.30")
            }
            HStack {
                Text("Delivery fee")
                Spacer()
                Text("EGP 65.00")
            }
            HStack {
                Text("Total amount").fontWeight(.bold)
                Spacer()
                Text("EGP 109.80").fontWeight(.bold)
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
