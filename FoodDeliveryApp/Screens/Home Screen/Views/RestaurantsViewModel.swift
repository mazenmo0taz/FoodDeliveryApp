//
//  RestaurantsViewModel.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 16/11/2025.
//

import Foundation
import SwiftUI
@Observable
final class RestaurantsViewModel:Identifiable{
    var isDataLoading:Bool = true
    var isImagesLoading:Bool = true 
    var apiRestaurants:[APIRestaurantData] = []
    var restaurants:[Restaurant] = []
    var filteredRestaurants:[Restaurant]{get{restaurants} set{}}
    var restaurantsImageString:[Int:String] = [:]
    var restaurantImages:[Int:Image] = [:]
    var restaurantsMenuItems: [Int : [MenuItem]] = [:]
    var service:NetworkApi
    var favoriteRestaurants:[Restaurant]{
        restaurants.filter({$0.isFavorite})
    }
    init(service: NetworkApi){
        self.service = service
    }
    func getRestaurants() async {
        do{
            apiRestaurants = try await service.get(from: .restaurants)
            restaurants = apiRestaurants.map { api in
                Restaurant(
                    restaurantID: api.id,
                    name: api.name,
                    image: restaurantsImageString[api.id] ?? "",
                    rating: Double.random(in: 2...5),
                    timeToDeliver: Int.random(in: 30...120),
                    deliveryFee: Int.random(in: 20...80),
                    haveDiscount: Bool.random(),
                    isFavorite: false,
                )
            }
            isDataLoading = false
            
            for restaurant in apiRestaurants {
                await getRestaurantsMenu(for: restaurant.id)
                if let imageUrl = restaurantsImageString[restaurant.id]{
                    await loadRestaurantImage(from: imageUrl, for: restaurant.id)
                }
            }
            isImagesLoading = false
        }catch{
            print(error)
        }
        
    }
    
    func getRestaurantsMenu(for id:Int) async{
        do{
            restaurantsMenuItems[id] = try await service.get(from: .menu(restaurantID: id))
            restaurantsImageString[id] = restaurantsMenuItems[id]?.first?.imageUrl
            
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func loadRestaurantImage(from url: String,for id:Int) async {
        do {
            let image = try await service.downloadImage(from: url)
            restaurantImages[id] = image
        } catch {
            print("Image download failed: \(error)")
        }
    }
    
    
    func applyFilters(filter: Filters? = nil,searchText: String?) {
            filteredRestaurants = restaurants.filter { restaurant in
                var matchesFilter: Bool = true
                switch filter {
                case .Pickup:
                     matchesFilter = filter == nil || true
                case .newlyAdded:
                     matchesFilter = filter == nil || true
                case .offers:
                     matchesFilter =  filter == nil || restaurant.haveDiscount
                case .ratingAbove3:
                    matchesFilter = filter == nil || restaurant.rating >= 3
                case .deliveryUnder50:
                    matchesFilter = filter == nil || restaurant.timeToDeliver <= 50
                default:
                    matchesFilter = true
                }
                let matchesSearch = searchText?.isEmpty ?? true || restaurant.name.localizedCaseInsensitiveContains(searchText!)
                return matchesFilter && matchesSearch
            }
        }
    
    
    let offerImageName: [String] = [
        "IMG_1713",
        "IMG_1714",
        "IMG_1715",
        "IMG_1716",
        "IMG_1717",
        "IMG_1718",
        "IMG_1719"
    ]
}
