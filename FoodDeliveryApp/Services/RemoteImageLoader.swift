//
//  RemoteImageLoader.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 19/11/2025.
//
import Foundation
import SwiftUI
import UIKit

@Observable
class ImageLoader {
    var image: Image?
    func load(from urlString: String) async {
        do{
            guard let image = try await BaseApi.shared.downloadImage(from: urlString) else { return }
            self.image = image
        }catch {
            print(error)
        }
    }
}

struct RemoteImageView: View {
    @State private var loader = ImageLoader()
    let url: String
    var body: some View {
        Group {
            if let image = loader.image {
                image
                    .resizable()
            } else {
                // Placeholder
                Rectangle()
                    .opacity(0.1)
                    .background(Color.gray)
                    .overlay(
                        ProgressView()
                    )
            }
        }
        .onAppear {
            Task{
                await loader.load(from: url)
            }
        }
    }
}
