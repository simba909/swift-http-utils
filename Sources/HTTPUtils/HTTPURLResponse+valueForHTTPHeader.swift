//
//  HTTPURLResponse+valueForHTTPHeader.swift
//
//
//  Created by Simon Jarbrant on 2022-07-16.
//

import Foundation

public extension HTTPURLResponse {
  func value<Value>(forHTTPHeader header: Header<Value>) -> Value? {
    guard let rawValue = value(forHTTPHeaderField: header.name) else {
      return nil
    }

    return header.transform(rawValue)
  }
}

public struct Header<T> {
  public var name: String
  public var transform: (String) -> T?

  public init(name: String, transform: @escaping (String) -> T?) {
    self.name = name
    self.transform = transform
  }
}

public extension Header where T == Date {
  static var expires: Header<Date> {
    self.init(name: "Expires") { rawValue in
      let formatter = DateFormatter.rfc1123Formatter
      return formatter.date(from: rawValue)
    }
  }
}
