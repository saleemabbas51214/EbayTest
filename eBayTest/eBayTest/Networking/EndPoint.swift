//
//  EndPoint.swift
//  eBayTest
//
//  Created by abbas on 25.06.23.
//

import Foundation

enum Endpoint {
    
    case earthquakes(north: Double, south: Double, east: Double, west: Double, username: String)
    
    var baseURL: URL {
        return URL(string: "http://api.geonames.org")!
    }
    
    var path: String {
        switch self {
        case .earthquakes:
            return "/earthquakesJSON"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .earthquakes(let north, let south, let east, let west, let username):
            return [
                URLQueryItem(name: "formatted", value: "true"),
                URLQueryItem(name: "north", value: String(north)),
                URLQueryItem(name: "south", value: String(south)),
                URLQueryItem(name: "east", value: String(east)),
                URLQueryItem(name: "west", value: String(west)),
                URLQueryItem(name: "username", value: username)
            ]
        }
    }
    
    func buildURL() -> URL? {
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        components?.path = path
        components?.queryItems = queryItems
        return components?.url
    }
}
