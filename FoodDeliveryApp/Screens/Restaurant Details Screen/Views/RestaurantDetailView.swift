////
////  RestaurantDetailView.swift
////  FoodDeliveryApp
////
////  Created by Mazen Moataz on 16/11/2025.
////
//
//import SwiftUI
//
//struct RestaurantDetailView: View {
//    @StateObject private var viewModel = RestaurantDetailViewModel()
//    @State private var selectedMenuTab = "Order again"
//    @Environment(\.dismiss) var dismiss
//    
//    var body: some View {
//        ScrollView {
//            VStack(spacing: 0) {
//                // Header Image Carousel
//                HeaderImageCarousel(images: viewModel.restaurant?.headerImages ?? [])
//                
//                // Restaurant Info Card
//                if let restaurant = viewModel.restaurant {
//                    RestaurantInfoCard(restaurant: restaurant)
//                        .padding(.horizontal)
//                        .offset(y: -20)
//                }
//                
//                // Share Benefits Banner
//                ShareBenefitsBanner()
//                    .padding(.horizontal)
//                    .padding(.top, -10)
//                
//                // Promo Banners
//                PromoBannersView(banners: viewModel.promoBanners)
//                    .padding(.top, 12)
//                
//                // Menu Tabs
//                MenuTabBar(selectedTab: $selectedMenuTab)
//                    .padding(.top, 16)
//                
//                // Menu Sections
//                ForEach(viewModel.menuSections) { section in
//                    MenuSectionView(section: section)
//                        .padding(.top, 24)
//                }
//            }
//        }
//        .ignoresSafeArea(edges: .top)
//        .overlay(alignment: .top) {
//            TopNavigationBar(dismiss: dismiss)
//        }
//    }
//}
//
//#Preview {
//    RestaurantDetailView()
//}
//
//struct HeaderImageCarousel: View {
//    let images: [String]
//    @State private var currentPage = 0
//    var body: some View {
//        ZStack(alignment: .topTrailing) {
//            TabView(selection: $currentPage) {
//                ForEach(0..<images.count, id: \.self) { index in
//                    Image(images[index])
//                        .resizable()
//                        .scaledToFill()
//                        .tag(index)
//                }
//            }
//            .frame(height: 200)
//            .tabViewStyle(.page(indexDisplayMode: .never))
//        }
//    }
//}
//
//struct RestaurantInfoCard: View {
//    let restaurant: Restaurantt
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 0) {
//            HStack(alignment: .top) {
//                // Logo
//                Image(restaurant.logoURL)
//                    .resizable()
//                    .frame(width: 60, height: 60)
//                    .background(Color.white)
//                    .cornerRadius(8)
//                    .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
//                
//                VStack(alignment: .leading, spacing: 4) {
//                    HStack {
//                        Text(restaurant.name)
//                            .font(.headline)
//                            .fontWeight(.semibold)
//                        
//                        Spacer()
//                        
//                        Image(systemName: "chevron.right")
//                            .foregroundColor(.gray)
//                    }
//                    
//                    Text(restaurant.cuisineTypes.joined(separator: " , "))
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
//                    
//                    HStack(spacing: 4) {
//                        Image(systemName: "star.fill")
//                            .font(.caption)
//                            .foregroundColor(.orange)
//                        
//                        Text("\(restaurant.rating, specifier: "%.1f")")
//                            .font(.subheadline)
//                            .fontWeight(.semibold)
//                        
//                        Text("(\(restaurant.reviewCount)+)")
//                            .font(.subheadline)
//                            .foregroundColor(.gray)
//                    }
//                }
//                .padding(.leading, 8)
//            }
//            
//            Divider()
//                .padding(.vertical, 12)
//            
//            // Delivery Info
//            HStack(spacing: 16) {
//                HStack(spacing: 4) {
//                    Image(systemName: "clock")
//                        .font(.subheadline)
//                    Text(restaurant.deliveryTime)
//                        .font(.subheadline)
//                }
//                
//                Circle()
//                    .fill(Color.gray.opacity(0.5))
//                    .frame(width: 4, height: 4)
//                
//                HStack(spacing: 4) {
//                    Image(systemName: "banknote")
//                        .font(.subheadline)
//                    Text(restaurant.deliveryFee)
//                        .font(.subheadline)
//                }
//                
//                Circle()
//                    .fill(Color.gray.opacity(0.5))
//                    .frame(width: 4, height: 4)
//                
//                HStack(spacing: 4) {
//                    Text(restaurant.deliveryMethod)
//                        .font(.subheadline)
//                    
//                    Image(systemName: "info.circle")
//                        .font(.caption)
//                }
//            }
//            .foregroundColor(.gray)
//        }
//        .padding()
//        .background(Color.white)
//        .cornerRadius(12)
//        .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 2)
//    }
//}
//
//
//// MARK: - Restaurant Model
//struct Restaurantt: Identifiable, Codable {
//    let id: String
//    let name: String
//    let cuisineTypes: [String]
//    let rating: Double
//    let reviewCount: Int
//    let deliveryTime: String
//    let deliveryFee: String
//    let deliveryMethod: String
//    let logoURL: String
//    let headerImages: [String]
//}
//
//// MARK: - Menu Item Model
//
//
//// MARK: - Promo Banner Model
//struct PromoBanner: Identifiable {
//    let id = UUID()
//    let discountText: String
//    let actionText: String
//    let backgroundColor: String
//}
//
//// MARK: - Menu Section Model
//struct MenuSection: Identifiable {
//    let id = UUID()
//    let title: String
//    let items: [MenuItem]
//}
//
//
//struct ShareBenefitsBanner: View {
//    var body: some View {
//        HStack {
//            Image(systemName: "crown.fill")
//                .foregroundColor(.white)
//                .padding(8)
//                .background(
//                    LinearGradient(colors: [.purple, .pink],
//                                 startPoint: .topLeading,
//                                 endPoint: .bottomTrailing)
//                )
//                .cornerRadius(8)
//            
//            Text("Share benefits with the family")
//                .font(.subheadline)
//                .fontWeight(.medium)
//                .foregroundColor(.white)
//            
//            Spacer()
//            
//            Text("Upgrade")
//                .font(.subheadline)
//                .fontWeight(.semibold)
//                .foregroundColor(.white)
//                .underline()
//        }
//        .padding()
//        .background(
//            .blue.gradient
//        )
//        .cornerRadius(12)
//    }
//}
//
//struct PromoBannersView: View {
//    let banners: [PromoBanner]
//    
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 12) {
//                ForEach(banners) { banner in
//                    PromoBannerCard(banner: banner)
//                }
//            }
//            .padding(.horizontal)
//        }
//    }
//}
//
//struct PromoBannerCard: View {
//    let banner: PromoBanner
//    
//    var body: some View {
//        HStack {
//            Text(banner.discountText)
//                .font(.subheadline)
//                .fontWeight(.semibold)
//            
//            Spacer()
//            
//            if !banner.actionText.isEmpty {
//                HStack(spacing: 4) {
//                    Image(systemName: "ticket.fill")
//                        .foregroundColor(.orange)
//                    Text(banner.actionText)
//                        .font(.subheadline)
//                        .fontWeight(.medium)
//                        .underline()
//                }
//            }
//        }
//        .padding()
//        .frame(width: 280, height: 60)
//        .background(.blue.gradient)
//        .cornerRadius(12)
//    }
//}
//
//
//struct MenuTabBar: View {
//    @Binding var selectedTab: String
//    let tabs = ["Order again", "Picks for you 🔥", "Offers", "Promotions"]
//    
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 24) {
//                ForEach(tabs, id: \.self) { tab in
//                    VStack(spacing: 8) {
//                        Text(tab)
//                            .font(.subheadline)
//                            .fontWeight(selectedTab == tab ? .semibold : .regular)
//                            .foregroundColor(selectedTab == tab ? .black : .gray)
//                        
//                        if selectedTab == tab {
//                            Rectangle()
//                                .fill(Color.black)
//                                .frame(height: 2)
//                        }
//                    }
//                    .onTapGesture {
//                        selectedTab = tab
//                    }
//                }
//            }
//            .padding(.horizontal)
//        }
//    }
//}
//
//struct MenuSectionView: View {
//    let section: MenuSection
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 12) {
//            Text(section.title)
//                .font(.title3)
//                .fontWeight(.bold)
//                .padding(.horizontal)
//            
//            if section.title.contains("Picks for you") {
//                Text("Trending items we think you'll love")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//                    .padding(.horizontal)
//            }
//            
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing: 16) {
//                    ForEach(section.items) { item in
//                        MenuItemCard(item: item)
//                    }
//                }
//                .padding(.horizontal)
//            }
//        }
//    }
//}
//
//struct MenuItemCard: View {
//    let item: MenuItem
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 8) {
//            // Item Image
//            Image(item.imageURL)
//                .resizable()
//                .scaledToFill()
//                .frame(width: 160, height: 120)
//                .clipped()
//                .cornerRadius(12)
//            
//            // Item Name
//            Text(item.name)
//                .font(.subheadline)
//                .fontWeight(.medium)
//                .lineLimit(2)
//            
//            // Price
//            HStack(spacing: 4) {
//                Text("EGP \(item.price, specifier: "%.2f")")
//                    .font(.subheadline)
//                    .fontWeight(.semibold)
//                
////                if let originalPrice = item.originalPrice {
////                    Text("EGP \(originalPrice, specifier: "%.2f")")
////                        .font(.caption)
////                        .foregroundColor(.gray)
////                        .strikethrough()
////                }
//            }
//        }
//        .frame(width: 160)
//    }
//}
//
//struct TopNavigationBar: View {
//    let dismiss: DismissAction
//    
//    var body: some View {
//        HStack {
//            Button(action: { dismiss() }) {
//                Image(systemName: "arrow.left")
//                    .font(.title3)
//                    .foregroundColor(.white)
//                    .padding(10)
//                    .background(Color.black.opacity(0.5))
//                    .clipShape(Circle())
//            }
//            
//            Spacer()
//            
//            HStack(spacing: 12) {
//                Button(action: {}) {
//                    Image(systemName: "heart")
//                        .font(.title3)
//                        .foregroundColor(.white)
//                        .padding(10)
//                        .background(Color.black.opacity(0.5))
//                        .clipShape(Circle())
//                }
//                
//                Button(action: {}) {
//                    Image(systemName: "square.and.arrow.up")
//                        .font(.title3)
//                        .foregroundColor(.white)
//                        .padding(10)
//                        .background(Color.black.opacity(0.5))
//                        
//                        .clipShape(Circle())
//                }
//                
//                Button(action: {}) {
//                    Image(systemName: "magnifyingglass")
//                        .font(.title3)
//                        .foregroundColor(.white)
//                        .padding(10)
//                        .background(Color.black.opacity(0.5))
//                        .clipShape(Circle())
//                }
//            }
//        }
//        .padding()
//    }
//}
