////
////  RestaurantDetailViewModel.swift
////  FoodDeliveryApp
////
////  Created by Mazen Moataz on 16/11/2025.
////
//
//import Foundation
//import Combine
//
//class RestaurantDetailViewModel: ObservableObject {
//    @Published var restaurant: Restaurantt?
//    @Published var menuSections: [MenuSection] = []
//    @Published var promoBanners: [PromoBanner] = []
//    @Published var isLoading = false
//    @Published var selectedTab = 0
//    
//    private var cancellables = Set<AnyCancellable>()
//    
//    init() {
//        loadMockData()
//    }
//    
//    // Replace this with real API call later
//    func loadMockData() {
//        // Mock restaurant data
//        restaurant = Restaurantt(
//            id: "1",
//            name: "EL Makhbaz El Lebnany El Asly",
//            cuisineTypes: ["Lebanese", "Manaqeesh", "Pizza"],
//            rating: 3.8,
//            reviewCount: 1000,
//            deliveryTime: "60 mins",
//            deliveryFee: "EGP 35.00",
//            deliveryMethod: "Delivered by restaurant",
//            logoURL: "restaurant_logo",
//            headerImages: ["food1", "food2", "food3"]
//        )
//        
//        // Mock promo banners
//        promoBanners = [
//            PromoBanner(discountText: "20% off select items",
//                       actionText: "View items",
//                       backgroundColor: "#F5E6D3"),
//            PromoBanner(discountText: "EGP 17 off with",
//                       actionText: "",
//                       backgroundColor: "#E8E8E8")
//        ]
//        
//        // Mock menu sections
//        let orderAgainItems = [
//            MenuItem(id: "1", name: "Manoucheh Alternative Lotus",
//                    price: 83.00, originalPrice: nil,
//                    imageURL: "item1", category: "Order again"),
//            MenuItem(id: "2", name: "Omelette with sausage Manous...",
//                    price: 139.26, originalPrice: nil,
//                    imageURL: "item2", category: "Order again"),
//            MenuItem(id: "3", name: "Yalla Netrawa2",
//                    price: 170.00, originalPrice: 189.00,
//                    imageURL: "item3", category: "Order again")
//        ]
//        
//        let picksForYouItems = [
//            MenuItem(id: "4", name: "Crepe Special",
//                    price: 95.00, originalPrice: nil,
//                    imageURL: "item4", category: "Picks for you"),
//            MenuItem(id: "5", name: "Cheese Crepe",
//                    price: 85.00, originalPrice: nil,
//                    imageURL: "item5", category: "Picks for you")
//        ]
//        
//        menuSections = [
//            MenuSection(title: "Order again", items: orderAgainItems),
//            MenuSection(title: "Picks for you 🔥", items: picksForYouItems)
//        ]
//    }
//    
//    // Future: Add real API integration
//    func fetchRestaurantDetails(restaurantId: String) {
//        isLoading = true
//        // Your API call here
//        // RestaurantService.shared.getRestaurant(id: restaurantId)
//        //     .sink { completion in ... }
//        //     .store(in: &cancellables)
//    }
//}
//
