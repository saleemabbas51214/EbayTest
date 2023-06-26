//
//  EarthquakeMapViewTests.swift
//  eBayTestTests
//
//  Created by abbas on 27.06.23.
//

import XCTest
import MapKit
import SwiftUI

@testable import eBayTest
class EarthquakeMapViewTests: XCTestCase {
    
    func testMapViewRegion() {
        // Create an instance of the model with dummy data
        let model = Earthquakes.dummyData
        
        // Create an instance of EarthquakeMapView with the model
        let mapView = EarthquakeMapView(model: model)
        
        // Verify that the computed region matches the expected region
        let expectedRegion = MKCoordinateRegion(center: model.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        
        XCTAssertEqual(mapView.region.center.latitude, expectedRegion.center.latitude, accuracy: 0.001)
        XCTAssertEqual(mapView.region.center.longitude, expectedRegion.center.longitude, accuracy: 0.001)
        XCTAssertEqual(mapView.region.span.latitudeDelta, expectedRegion.span.latitudeDelta, accuracy: 0.001)
        XCTAssertEqual(mapView.region.span.longitudeDelta, expectedRegion.span.longitudeDelta, accuracy: 0.001)
    }
    
}
