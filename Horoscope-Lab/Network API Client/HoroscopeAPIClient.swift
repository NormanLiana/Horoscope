//
//  HoroscopeAPIClient.swift
//  Horoscope-Lab
//
//  Created by Liana Norman on 9/24/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

class HoroscopeAPIClient {
    private init() {}
    
    static var shared = HoroscopeAPIClient()
    
    
    func getShows(userSearchTerm: String?, completionHandler: @escaping (Result<Horoscope, AppError>) -> () ) {
        if let urlString = userSearchTerm {
            let noSpacesURL = urlString.replacingOccurrences(of: " ", with: "-")
            let urlStr = "http://api.tvmaze.com/search/shows?q=\(noSpacesURL)"
            
            NetworkManager.shared.fetchData(urlString: urlStr) { (result) in
                switch result {
                case .failure( _):
                    completionHandler(.failure(.badURL))
                case .success(let data):
                    do {
                        let showInfo = try JSONDecoder().decode(Horoscope.self, from: data)
                        completionHandler(.success(showInfo))
                    } catch {
                        completionHandler(.failure(.noDataError))
                    }
                    
                }
            }
        }
        
    }
    
    
}
