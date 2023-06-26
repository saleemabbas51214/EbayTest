//
//  EarthQuakeMockService.swift
//  eBayTest
//
//  Created by abbas on 26.06.23.
//

import Foundation
import Combine

struct EarthQuakeMockService: EarthQuakeServiceProtocol {
    
    func fetchEarthQuakeData() -> AnyPublisher<[Earthquake], Error> {
        do {
            guard let url = Bundle.main.url(forResource: "EarthQuakeData", withExtension: "json") else {
                throw URLError(.fileDoesNotExist)
            }
            
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let earthquakes = try decoder.decode(Earthquakes.self, from: data)
            return Just(earthquakes.earthquakes)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: error)
                .eraseToAnyPublisher()
        }
    }
    
}
