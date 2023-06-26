//
//  ResultState.swift
//  eBayTest
//
//  Created by abbas on 24.06.23.
//

import Foundation

enum ResultState {
    case loading
    case failed(error: Error)
    case success(content: [Earthquake])
}
