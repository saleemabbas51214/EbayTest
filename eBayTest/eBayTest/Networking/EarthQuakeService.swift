//
//  APIService.swift
//  eBayTest
//
//  Created by abbas on 24.06.23.
//

import Foundation
import Combine

protocol EarthQuakeServiceProtocol {
    func fetchEarthQuakeData() -> AnyPublisher<[Earthquake], Error>
}

class EarthQuakeService: EarthQuakeServiceProtocol {
    
    func fetchEarthQuakeData() -> AnyPublisher<[Earthquake], Error> {
        
        let endpoints = Endpoint.earthquakes(north: 44.1, south: -9.9, east: -22.4, west: 34.5, username: "mkoppelman")
        
        guard let url = endpoints.buildURL() else {
            return Fail(error: EarthQuakeServiceError.invalidURL).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw EarthQuakeServiceError.networkError
                }
                return data
            }
            .decode(type: Earthquakes.self, decoder: JSONDecoder())
            .map(\.earthquakes)
            .mapError { error in
                if let decodingError = error as? DecodingError {
                    return EarthQuakeServiceError.decodingError(decodingError)
                } else {
                    return EarthQuakeServiceError.unknownError(error)
                }
            }
            .eraseToAnyPublisher()
    }
    
}
