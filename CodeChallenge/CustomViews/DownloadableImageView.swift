//
//  DownloadableImageView.swift
//  CodeChallenge
//
//  Created by Peripolli on 09/03/20.
//  Copyright © 2020 gobleboo. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

class DownloadableImageView: UIImageView {
    let baseURL = "http://image.tmdb.org/t/p/original/"
    var imageURLString: String = ""
    
    func loadImage(using urlString: String) {
        guard let url = URL(string: baseURL + urlString) else {
            fatalError("Could not set a valid url for image")
        }
        
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
            if error != nil {
                print(error ?? "Could not print error for image request.")
                return
            }
            
            DispatchQueue.main.async {
                guard let imageData = data else {
                    fatalError("Could not get data for image request.")
                }
                let imageToCache = UIImage(data: imageData)
                imageCache.setObject(imageToCache!, forKey: urlString as NSString)
                self.image = imageToCache
            }
            }).resume()
    }
    
}
