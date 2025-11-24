//
//  ItemDetailsViewModel.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 24/11/2025.
//
import SwiftUI

@Observable
class ItemDetailsViewModel{
    var item: MenuItem
    var itemCount = 1
    var OrderNoteIsPresent:Bool = false
    var orderNote:String = ""
    init(item: MenuItem) {
        self.item = item
    }
}
