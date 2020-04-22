import XCTest
import HPNetwork
@testable import HPOpenWeather

final class HPOpenWeatherTests: XCTestCase {

    override class func setUp() {
        super.setUp()

        HPOpenWeather.shared.apiKey = TestSecret.apiKey
    }

    override func tearDown() {
        super.tearDown()

        HPOpenWeather.shared.apiKey = nil
    }

    func testCurrentRequest() {
        let request = WeatherRequest(coordinate: .init(latitude: 40, longitude: 30), configuration: .default)
        let exp = XCTestExpectation(description: "Fetched data")

        HPOpenWeather.shared.requestWeather(request) { result in
            exp.fulfill()
            XCTAssertResult(result)
        }

        wait(for: [exp], timeout: 10)
    }

    func testTimeMachineRequestFailing() {
        let request = TimeMachineRequest(coordinate: .init(latitude: 40, longitude: 30), date: Date().addingTimeInterval(-3600), configuration: .default)
        let exp = XCTestExpectation(description: "Fetched data")

        HPOpenWeather.shared.requestWeather(request) { result in
            exp.fulfill()
            XCTAssertResultError(result)
        }

        wait(for: [exp], timeout: 10)
    }

    func testTimeMachineRequest() {
        let request = TimeMachineRequest(coordinate: .init(latitude: 40, longitude: 30), date: Date().addingTimeInterval(-7 * .hour), configuration: .default)
        let exp = XCTestExpectation(description: "Fetched data")

        HPOpenWeather.shared.requestWeather(request) { result in
            exp.fulfill()
            XCTAssertResult(result)
        }

        wait(for: [exp], timeout: 10)
    }

}

extension Encodable {

    func encodeAndDecode<T: Decodable>(type: T.Type) throws -> T {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.dateEncodingStrategy = .secondsSince1970
        let encodedData = try jsonEncoder.encode(self)

        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .secondsSince1970
        return try jsonDecoder.decode(type.self, from: encodedData)
    }

}

/// Asserts that the result is not a failure
func XCTAssertResult<T, E: Error>(_ result: Result<T, E>) {
    if case .failure(let error as NSError) = result {
        print(error)
        XCTFail(error.localizedDescription)
    }
}

/// Asserts that the result is not a failure
func XCTAssertResultError<T, E: Error>(_ result: Result<T, E>) {
    if case .success(_) = result {
        XCTFail("Result was not an error")
    }
}
