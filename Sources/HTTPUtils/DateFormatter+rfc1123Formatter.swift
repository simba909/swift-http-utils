//
//  DateFormatter+rfc1123Formatter.swift
//
//
//  Created by Simon Jarbrant on 2022-07-16.
//

import Foundation

public extension DateFormatter {
  static var rfc1123Formatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss z"

    return formatter
  }
}
