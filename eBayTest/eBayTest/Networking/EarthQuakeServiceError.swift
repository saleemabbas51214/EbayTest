//
//  APIError.swift
//  eBayTest
//
//  Created by abbas on 24.06.23.
//

import Foundation

enum EarthQuakeServiceError: Error {
    case invalidURL
    case networkError
    case decodingError(Error)
    case unknownError(Error)
}
