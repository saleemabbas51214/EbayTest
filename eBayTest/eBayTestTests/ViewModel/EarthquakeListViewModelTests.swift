//
//  eBayTestTests.swift
//  eBayTestTests
//
//  Created by abbas on 27.06.23.
//

import XCTest
import Combine

@testable import eBayTest

class EarthQuakeViewModelTests: XCTestCase {
    
    var viewModel: EarthQuakeViewModel!
    var mockService: EarthQuakeServiceProtocol!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        mockService = EarthQuakeMockService()
        viewModel = EarthQuakeViewModel(service: mockService)
        cancellables = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        cancellables = nil
        viewModel = nil
        mockService = nil
        super.tearDown()
    }
    
    func test_viewModelInitialState() {
        XCTAssertNil(viewModel.earthQuakesData)
        XCTAssertNil(viewModel.error)
        XCTAssertEqual(viewModel.cancelSet, [])
    }
    
    func testFetchData_Success() {
        // Create an expectation to wait for the async task to complete
        let expectation = XCTestExpectation(description: "Fetch data completion")
        
        // Call the fetchData method
        viewModel.fetchData()
        
        XCTAssertNil(viewModel.earthQuakesData)
        
        // Wait for a short time to allow the async task to complete
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            // Verify that the fetched data is not nil
            XCTAssertNotNil(self?.viewModel.earthQuakesData)
            
            // Fulfill the expectation
            expectation.fulfill()
        }
        
        // Wait for the expectation to be fulfilled
        wait(for: [expectation], timeout: 2)
    }
    
}
