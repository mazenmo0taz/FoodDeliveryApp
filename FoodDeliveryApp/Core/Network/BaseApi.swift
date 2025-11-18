//
//  BaseApi.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 17/11/2025.
//

import Foundation
import SwiftUI
import UIKit
enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case statusCode(Int)
    case decodingError
    case downloadError
}

struct BaseApi {
   static let shared = BaseApi()
    func get<T: Decodable>(from urlString: String) async throws -> T {
        
        guard let url = URL(string: urlString) else{
           throw NetworkError.invalidURL
        }
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.statusCode(httpResponse.statusCode)
        }
        
        do{
            return try JSONDecoder().decode(T.self, from: data)
        }catch {
           throw NetworkError.decodingError
        }
    }
    
    func downloadImage(from urlString: String) async throws -> Image? {
        guard let url = URL(string: urlString) else{
            return nil
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let data = data as Data? else {
            return nil
        }
        guard let uiImage = UIImage(data: data) else{
            return nil
        }
        let image = Image(uiImage: uiImage)
        return image
    }
    
}
