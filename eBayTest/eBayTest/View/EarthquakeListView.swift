//
//  EarthquakeListView.swift
//  eBayTest
//
//  Created by abbas on 26.06.23.
//

import SwiftUI

struct EarthQuakeListView: View {
    
    @StateObject var viewModel: EarthQuakeViewModel
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .success(let earthquakeData):
                NavigationView {
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(earthquakeData) { data in
                                NavigationLink(
                                    destination: EarthquakeMapView(model: data)
                                ) {
                                    EarthquakeView(model: data)
                                }
                            }
                        }.padding()
                    }
                    .navigationTitle(AppLabels.EarthQuakeList.title)
                }.tint(.black)
            case .failed(error: let error):
                ErrorView(error: error) {
                    viewModel.fetchData()
                }
            }
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}

struct EarthQuakeListView_Previews: PreviewProvider {
    static var previews: some View {
        AppEnvironment.current.makeEarthQuakeListView()
    }
}
