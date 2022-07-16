import XCTest
@testable import HTTPUtils

final class HTTPUtilsTests: XCTestCase {
  func testExpiresHeader() throws {
    let response = HTTPURLResponse(
      url: URL(string: "http://example.com")!,
      statusCode: 200,
      httpVersion: "HTTP/1.1",
      headerFields: [
        "Expires": "Wed, 21 Oct 2015 07:28:00 GMT"
      ]
    )

    let expirationDate = response?.value(forHTTPHeader: .expires)

    var dateComponents = DateComponents()
    dateComponents.year = 2015
    dateComponents.month = 10
    dateComponents.day = 21
    dateComponents.timeZone = TimeZone(secondsFromGMT: 0)
    dateComponents.hour = 7
    dateComponents.minute = 28

    let calendar = Calendar(identifier: .gregorian)
    let expectedDate = calendar.date(from: dateComponents)

    XCTAssertEqual(expirationDate, expectedDate)
  }
}
