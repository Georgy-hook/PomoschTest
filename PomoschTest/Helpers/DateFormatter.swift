//
//  DateFormatter.swift
//  ImageFeed
//
//  Created by Georgy on 28.05.2023.
//

import UIKit
class AppDateFormatter {
    static let shared = AppDateFormatter()
    
    private init() {}
    
    private lazy var dateFormatterFromString: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter
    }()
    
    func stringToDate(with string: String) -> Date? {
        return dateFormatterFromString.date(from: string)
    }
}
