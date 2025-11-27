//
//  NotesTextFieldView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 24/11/2025.
//

import Foundation
import SwiftUI

struct NotesView<vm:HaveNotesViewScreen>:View {
    @Bindable var viewModel: vm
    @FocusState var isFocused:Bool
    var textFieldPlaceHolder:String
    var body: some View {
        VStack{
            VStack(alignment: .leading,spacing: 0){
                Text("Any Special requests?")
                .font(.body)
                .bold()
                .foregroundStyle(.secondary)
                TextField(textFieldPlaceHolder, text: $viewModel.orderNote,axis: .vertical)
                .focused($isFocused)
                .toolbar {
                    ToolbarItem(placement: .keyboard){
                        Spacer()
                        Button("Done"){
                            isFocused = false
                        }
                    }
                }
                Spacer()
            }
            .frame(height: 100)
            .padding(.horizontal)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.primary, lineWidth: 1)
            }
            Spacer()
            
            HStack{
                Spacer()
                Text("\(viewModel.orderNote.count)/\(200)")
                .bold()
                .foregroundStyle(.secondary)
            }
        }
        .padding()
        .background(.white)
        .onAppear{
            isFocused = true
        }
    }
    
}

