//
//  ApiManager.swift
//  eliheineman-500px
//
//  Created by eli heineman on 2020-10-06.
//

import Foundation

protocol ApiManagerDelegate {
    func didGetPhotos(_ apiManager: ApiManager, photoData: Root)
    func didFailWithError(_ error: Error)
}

struct ApiManager {
    var pageToLoad = 1
    let photoUrl = "https://api.500px.com/v1/photos?feature=popular&image_size=3"
    var delegate: ApiManagerDelegate?

    mutating func fetchPhotos() {
        print("getting photos for page \(pageToLoad)")
        let urlString = "\(photoUrl)&key=\(ApiKey.key)&page=\(pageToLoad)"
        self.performRequest(with: urlString)
        pageToLoad += 1
    }
        
    func performRequest(with urlString: String) {
        
        if let url = URL(string: urlString) {
            
            let request = URLRequest(url: url)
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request) { (data, response, error) in
                
                if error != nil {
                    self.delegate?.didFailWithError(error!)
                    return
                }
                
                if let safeData = data {
                    if let photoData = self.parseJSON(safeData) {
                        self.delegate?.didGetPhotos(self, photoData: photoData)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(_ photoData: Data) -> Root? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(Root.self, from: photoData)
            return decodedData
        } catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }
}
