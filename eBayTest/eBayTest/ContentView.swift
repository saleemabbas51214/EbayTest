//
//  ContentView.swift
//  eBayTest
//
//  Created by abbas on 24.06.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        EarthQuakeListView(viewModel: EarthQuakeViewModel(service: EarthQuakeService()))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .background(Color.white)
    }
}
