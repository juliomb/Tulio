//
//  HotwireAPIManagerURLSessionImpl.swift
//  Tulio
//
//  Created by Julio Martinez on 22/08/2017.
//  Copyright © 2017 Julio Martinez. All rights reserved.
//

import Foundation

class HotwireAPIManagerURLSessionImpl: HotwireAPIManager {
    
    let session = URLSession.shared
    let baseURLComponents = URLComponents(string: "http://api.hotwire.com/v1/search/car")!
    let baseQueryItems = [URLQueryItem(name: "apiKey", value: Settings.apiKey), URLQueryItem(name: "format", value: "json")]
    
    
    func searchCars(withSearchParams searchParams: SearchParams, completion: @escaping ([CarResult]) -> Void, onError: ((Error) -> Void)? = nil) {
        guard let url = buildURL(withSearchParams: searchParams) else {
            fatalError("Error building the url to search cars")
        }
        
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if let error = error, let onError = onError {
                onError(error)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String, Any>
                    var carResults: [CarResult] = []
                    if let carsJSON = json["Result"] as? [Dictionary<String, String>] {
                        for carJSON in carsJSON {
                            if let carResult = CarResult(json: carJSON){
                                carResults.append(carResult)
                            }
                        }
                    }
                    completion(carResults)
                } catch {
                    print("Error parsing car results: " + error.localizedDescription)
                    if let onError = onError {
                        onError(error)
                    }
                }
            }
            
        })
        task.resume()
        
    }
    
    
    fileprivate func buildURL(withSearchParams searchParams: SearchParams) -> URL? {
        var components = baseURLComponents
        components.queryItems = baseQueryItems
        let searchQueryItems = [
            URLQueryItem(name: "dest", value: searchParams.place),
            URLQueryItem(name: "startdate", value: SharedFormatters.onlyDateFormatter.string(from: searchParams.fromDate)),
            URLQueryItem(name: "enddate", value: SharedFormatters.onlyDateFormatter.string(from: searchParams.untilDate)),
            URLQueryItem(name: "pickuptime", value: SharedFormatters.onlyTimeFormatter.string(from: searchParams.fromDate)),
            URLQueryItem(name: "dropofftime", value: SharedFormatters.onlyTimeFormatter.string(from: searchParams.untilDate)),        ]
        components.queryItems?.append(contentsOf: searchQueryItems)
        return components.url
    }
    
}
