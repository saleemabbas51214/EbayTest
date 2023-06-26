//
//  Earthquake.swift
//  eBayTest
//
//  Created by abbas on 24.06.23.
//

import Foundation
import CoreLocation

struct Earthquake: Codable, Identifiable {
    
    var id: String { eqid }
    var datetime: String
    var depth: Double
    var lng: Double
    var src: String
    var eqid: String
    var magnitude: Double
    var lat: Double
    
    var coordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: lat, longitude: lng)
    }
}
struct Earthquakes: Codable {
    let earthquakes: [Earthquake]
}

extension Earthquakes {
    
    static var dummyData: Earthquake {
        .init(datetime: "12-05-2023", depth: 4.8, lng: 9.5, src: "some", eqid: "UX10", magnitude: 45.0, lat: 23.6)
    }
}


