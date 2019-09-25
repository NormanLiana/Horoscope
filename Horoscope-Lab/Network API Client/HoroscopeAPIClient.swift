//
//  HoroscopeAPIClient.swift
//  Horoscope-Lab
//
//  Created by Liana Norman on 9/24/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

class HoroscopeAPIManager {
    private init() {}
    
    static let shared = HoroscopeAPIManager()
    
    func getElements(completionHandler: @escaping (Result<Horoscope, AppError>) -> () ) {
        let urlStr = "http://sandipbgt.com/theastrologer/api/horoscope/gemini/today"
        
        guard let url = URL(string: urlStr) else {
            completionHandler(.failure(.badURL))
            return
        }
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let elementInfo = try JSONDecoder().decode(Horoscope.self, from: data)
                    
                    completionHandler(.success(elementInfo))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
    
//    func postElement(element: FavoriteElement, completionHandler: @escaping (Result<Data, AppError>) -> () ) {
//
//        guard let encodedData = try? JSONEncoder().encode(element) else {
//            fatalError("encoder failed")
//        }
//        let urlStr = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/favorites"
//        guard let url = URL(string: urlStr) else {
//            completionHandler(.failure(.badURL))
//            return
//        }
//        NetworkHelper.manager.performDataTask(withUrl: url, andHTTPBody: encodedData, andMethod: .post) { (result) in
//            switch result {
//            case .success(let data):
//                completionHandler(.success(data))
//            case .failure(let error):
//                print(error)
//
//            }
//        }
//    }
    
    
}
