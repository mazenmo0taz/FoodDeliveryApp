//
//  AddNoteButtonLabel.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 27/11/2025.
//

import Foundation
import SwiftUI
struct NotesButtonLabelView: View {
    var viewModel: HaveNotesViewScreen
    var haveAddNoteBtn: Bool = true
    var body: some View {
        HStack(spacing:15){
            Image(systemName: "message")
                .font(.title2)
            
            VStack(alignment:.leading){
                Text("Any special requests?")
                
                if !viewModel.orderNote.isEmpty{
                    Text(viewModel.orderNote)
                        .foregroundStyle(.secondary)
                }
            }
            .font(.callout)
            .lineLimit(3)
            .bold()
            
            Spacer()
            if haveAddNoteBtn{
                Text(viewModel.orderNote.isEmpty ? "Add note" : "Edit")
                .bold()
                .underline()
                .padding(.trailing,7)
            }
            
        }
        .frame(height: 25)
        .padding(.vertical)
        .frame(maxWidth: .infinity)
    }
}
