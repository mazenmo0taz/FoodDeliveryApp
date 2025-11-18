//
//  RestaurantsViewModel.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 16/11/2025.
//

import Foundation
import SwiftUI
@Observable
class RestaurantsViewModel:Identifiable{
    var isDataLoading:Bool = true
    var isImagesLoading:Bool = true
    var apiRestaurants:[APIRestaurantData] = []
    var restaurants:[Restaurant] = []
    var restaurantsImageString:[Int:String] = [:]
    var restaurantImages:[Int:Image] = [:]
    var RestaurantsMenuItems: [Int : [MenuItem]] = [:]
    var selectedRestaurant: Restaurant?{
        didSet{
            print(selectedRestaurant)
        }
    }
    func getRestaurants() async {
        do{
            apiRestaurants = try await BaseApi.shared.get(from: "https://fakerestaurantapi.runasp.net/api/restaurant")
            
            restaurants = apiRestaurants.map { api in
                Restaurant(
                    restaurantID: api.id,
                    name: api.name,
                    image: restaurantsImageString[api.id] ?? "",
                    rating: Double.random(in: 2...5),
                    timeToDeliver: Int.random(in: 30...120),
                    deliveryFee: Int.random(in: 20...80),
                    haveDiscount: Bool.random(),
                    isFavorite: false
                )
            }
            isDataLoading = false
            
            for restaurant in apiRestaurants {
                await getRestaurantsMenu(for: restaurant.id)
                if let imageUrl = restaurantsImageString[restaurant.id]{
                    await loadRestaurantImage(from: imageUrl, for: restaurant.id)
                }
                print(restaurant.id)
            }
           isImagesLoading = false
        }catch{
            print(error)
        }
    }
    
    func getRestaurantsMenu(for id:Int) async{
        do{
            RestaurantsMenuItems[id] = try await BaseApi.shared.get(from: "https://fakerestaurantapi.runasp.net/api/restaurant/\(id)/menu")
            restaurantsImageString[id] = RestaurantsMenuItems[id]?.first?.imageUrl
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func loadRestaurantImage(from url: String,for id:Int) async {
            do {
                let image = try await BaseApi.shared.downloadImage(from: url)
                restaurantImages[id] = image
                
            } catch {
                print("Image download failed: \(error)")
            }
        }
    
    let offersMockData: [String] = [
        "10% off on all orders",
        "Free delivery on orders over 50 EGP",
        "Buy one get one 50% off",
        "UP to 140 EGP off on all orders",
        "Monthly free delivery"
    ]
}
