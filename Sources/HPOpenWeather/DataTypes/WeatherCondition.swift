import Foundation

/// Type that holds information about weather conditions
public struct WeatherCondition: Codable, Equatable, Hashable {

    /// The weather condition ID
    public let id: Int
    /// Group of weather parameters
    public let main: String
    /// The weather condition within the group
    public let description: String
    /// The ID of the corresponding weather icon
    public let iconString: String

    static let unknown = WeatherCondition(
        id: 0,
        main: "Unknown Weather Condition",
        description: "No Description",
        iconString: "No Icon")

    enum CodingKeys: String, CodingKey {
        case id
        case main
        case description
        case iconString = "icon"
    }

}
