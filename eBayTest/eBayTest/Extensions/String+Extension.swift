//
//  String+Extension.swift
//  eBayTest
//
//  Created by abbas on 26.06.23.
//

import Foundation

extension String {
    var displayDate: String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = formatter.date(from: self) ?? Date()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
