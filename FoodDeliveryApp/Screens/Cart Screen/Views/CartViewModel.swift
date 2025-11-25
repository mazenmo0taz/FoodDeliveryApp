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
    var RestaurantDeliveryFee: Int
    init (RestaurantDeliveryFee: Int) {
        self.RestaurantDeliveryFee = RestaurantDeliveryFee
    }
    func addToCart(itemId:Int, item: MenuItem, quantity: Int, note: String?) {
        items.append(CartItem(id: itemId, item: item, note: note,quantity:quantity))
    }
    
    func incrementItemQuantity(itemId: Int) {
        if let index = items.firstIndex(where: { $0.item.id == itemId }){
            items[index].quantity += 1
        }
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
        items.reduce(0) { result, item in
            result + item.quantity
        }
    }
    
    var total: Int {
        items.reduce(0) { result, item in
            result + (item.item.itemPrice * item.quantity)
        }
    }
}
