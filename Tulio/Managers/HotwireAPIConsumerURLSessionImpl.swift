//
//  HotwireAPIConsumerURLSessionImpl.swift
//  Tulio
//
//  Created by Julio Martinez on 22/08/2017.
//  Copyright © 2017 Julio Martinez. All rights reserved.
//

import Foundation

class HotwireAPIConsumerURLSessionImpl: HotwireAPIConsumer {
    
    let session = URLSession.shared
    let baseURLComponents = HotwireAPISettings.baseURLComponents
    let baseQueryItems = [URLQueryItem(name: "apiKey", value: HotwireAPISettings.apiKey), URLQueryItem(name: "format", value: "json")]
    
    
    func searchCars(withSearchParams searchParams: SearchParams, completion: @escaping ([CarResult]) -> Void, onError: ((Error) -> Void)? = nil) {
        guard let url = buildURL(withSearchParams: searchParams) else {
            fatalError("Error building the url to search cars")
        }
        
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if let error = error, let onError = onError {
                DispatchQueue.main.async { onError(error) }
                return
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String, Any>
                    if let carsJSON = json["Result"] as? [Dictionary<String, Any>] {
                        let carResults = CarResult.carResults(fromJSON: carsJSON)
                        DispatchQueue.main.async { completion(carResults) }
                    } else {
                        DispatchQueue.main.async { completion([]) }
                    }
                } catch {
                    print("Error parsing car results: " + error.localizedDescription)
                    if let onError = onError {
                        DispatchQueue.main.async { onError(error) }
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
