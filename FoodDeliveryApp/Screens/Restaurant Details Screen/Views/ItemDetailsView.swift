//
//  ItemDetailsView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 23/11/2025.
//

import SwiftUI

struct ItemDetailsView: View {
    @State var orderItemNote:String?
    @State var orderNote:String
    @State var itemsCount = 1
    @State var OrderNoteIsPresent:Bool = false
    var body: some View {
        ZStack{
            
            
            VStack(spacing:15){
                Image("restaurantImagePH")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 280)
                    .frame(maxWidth: .infinity)
                   
                
                VStack(alignment:.leading,spacing:10) {
                    Text("Item Name")
                        .font(.title)
                        .fontWeight(.semibold)
                    Text("Item Description")
                        .fontWeight(.semibold)
                        .bold()
                        .foregroundStyle(.secondary)
                    
                    Button{
                        OrderNoteIsPresent = true
                    }label: {
                        NotesButtonLabelView()
                    }
                    
                }
                .padding(.horizontal)
                
                AddItemView(count: $itemsCount)
                    .padding()
            }
            Color.black.opacity(OrderNoteIsPresent ? 0.5 : 0)
            .ignoresSafeArea(.all)
        }
        .padding(.bottom)
        
        .sheet(isPresented: $OrderNoteIsPresent){
            NotesView(text: $orderNote)
                .presentationDetents([.height(140)])
        }
       
    }
}

#Preview {
    ItemDetailsView(orderNote: "")
}


struct AddItemView: View {
    @Binding var count: Int
    var min = 1
    var max = 10
    var body: some View {
        HStack(spacing: 15) {
            
            HStack {
                Button{
                    if count > min { count -= 1 }
                }label: {
                    Image(systemName: "minus")
                        .foregroundColor(count==min ? .gray : .orange)
                        .font(.title3)
                        .bold()
                }
               
                Text("\(count)")
                    .bold()
                    .foregroundColor(.black)
                    .padding()
                
                Button{
                    if count < max { count += 1 }
                }label: {
                    Image(systemName: "plus")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.orange)
                }
            }
            .frame(width: 130, height: 50)
            .modifier(StrokeLineModifier())
            
            Button{
                //add to cart
            }label: {
                HStack {
                    Text("Add item")
                        .font(.system(size: 18, weight: .bold))
                    Spacer()
                    Text("EGP 60.00")
                        .font(.system(size: 18, weight: .bold))
                }
                .foregroundColor(.white)
                .padding(.horizontal)
            }
            .frame(height: 50)
            .background(Color.orange)
            .clipShape(Capsule())
        }
        
    }
}


struct NotesButtonLabelView: View {
    var body: some View {
        HStack(spacing:15){
            Image(systemName: "message")
                .font(.title2)
            Text("Any special requests?")
            Spacer()
            Text("Add note")
                .bold()
                .underline()
                .padding(.trailing,7)
        }
        .frame(height: 30)
        .padding(.vertical)
        .frame(maxWidth: .infinity)
    }
}

struct NotesView:View {
    @Binding var text: String
    @FocusState var isFocused:Bool
    var body: some View {
        VStack(alignment: .leading,spacing: 0){
            Text("Special request")
                .font(.body)
                .bold()
                .foregroundStyle(.secondary)
            TextField("ssss", text: $text,axis: .vertical)
                .focused($isFocused)
            //.frame(maxHeight: .infinity)
                
            Spacer()
        }
        .frame(height: 100)
        .padding(.horizontal)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay {
            RoundedRectangle(cornerRadius: 8)
            .stroke(.primary, lineWidth: 1)
        }
        .padding()
        Spacer()
        .onAppear{
                isFocused = true
        }
        
    }
    
}
