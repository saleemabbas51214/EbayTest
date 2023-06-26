//
//  EarthquakeMapView.swift
//  eBayTest
//
//  Created by abbas on 27.06.23.
//

import SwiftUI
import MapKit

struct EarthquakeMapView: View {
    
    var model: Earthquake
    
    var region: MKCoordinateRegion {
        MKCoordinateRegion(center: model.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    }
    
    var body: some View {
        Map(coordinateRegion: .constant(region))
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct EarthquakeMapView_Previews: PreviewProvider {
    static var previews: some View {
        EarthquakeMapView(model: Earthquakes.dummyData)
    }
}
