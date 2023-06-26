//
//  EarthquakeListViewModel.swift
//  eBayTest
//
//  Created by abbas on 25.06.23.
//

import Foundation
import Combine

class EarthQuakeViewModel: ObservableObject {
    
    let earthQuakeService: EarthQuakeServiceProtocol
    
    @Published var earthQuakesData: [Earthquake]?
    @Published var error: Error? = nil
    @Published private(set) var state: ResultState = .loading
    
    var cancelSet: Set<AnyCancellable> = []
    
    init(service: EarthQuakeServiceProtocol) {
        earthQuakeService = service
    }
    
    func fetchData() {
        earthQuakeService.fetchEarthQuakeData()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.state = .failed(error: error)
                }
            }, receiveValue: { [weak self] earthquakes in
                self?.state = .success(content: earthquakes)
                self?.earthQuakesData = earthquakes
            })
            .store(in: &cancelSet)
        
    }
    
}
