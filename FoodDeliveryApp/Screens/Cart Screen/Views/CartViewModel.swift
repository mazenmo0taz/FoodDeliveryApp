//
//  CartViewModel.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 24/11/2025.
//

import SwiftUI

@Observable
class CartViewModel {
    var cartNote: String = "Anything else we need to know?"
    var items: [CartItem] = []
    
    func addToCart(item: MenuItem, quantity: Int, note: String?) {
            items.append(CartItem(item: item, note: note,quantity:quantity))
    }
    
    func removeFromCart(itemId: Int) {
        let index = items.firstIndex(where: { $0.item.id == itemId })!
        if  (items[index].quantity == 1) {
            items.remove(at: index)
        }else{
            items[index].quantity -= 1
        }
    }
    func sameOrderCount(itemId: Int) -> Int{
        let index = items.firstIndex(where: { $0.item.id == itemId })!
        return items[index].quantity
    }
    var count: Int {
        items.count
    }
}
