//
//  AppEnvironment.swift
//  eBayTest
//
//  Created by abbas on 26.06.23.
//

import Foundation

protocol Environment {
    var earthQuakeService: EarthQuakeServiceProtocol { get }
}

protocol AppFactory {
    func makeEarthQuakeListView() -> EarthQuakeListView
}

struct AppEnvironment: Environment {
    static let current = AppEnvironment()
    
    var earthQuakeService: EarthQuakeServiceProtocol {
        return EarthQuakeMockService()
    }
}

extension AppEnvironment: AppFactory {
    func makeEarthQuakeListView() -> EarthQuakeListView {
        let vm = EarthQuakeViewModel(service: earthQuakeService)
        return EarthQuakeListView(viewModel: vm)
    }
}
