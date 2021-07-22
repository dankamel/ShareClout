//
//  PostFound.swift
//  ShareClout
//
//  Created by Daniel Kamel on 22/07/2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Decodable {
    var greeting: String?
    var instructions: [Instruction]?
}

// MARK: - Instruction
struct Instruction: Decodable {
    var postFound: PostFound?

    enum CodingKeys: String, CodingKey {
        case postFound = "PostFound"
    }
}

// MARK: - PostFound
struct PostFound: Decodable {
    var id: String?
    var postHashHex, posterPublicKeyBase58Check, parentStakeID, body: String?
    var imageURLs: [String]?
//    var recloutedPostEntryResponse: JSONNull?
    var creatorBasisPoints, stakeMultipleBasisPoints: Int?
    var timestampNanos: Double?
    var isHidden: Bool?
    var confirmationBlockHeight: Int?
    var inMempool: Bool?
    var stakeEntry: StakeEntry?
    var stakeEntryStats: StakeEntryStats?
    var profileEntryResponse: ProfileEntryResponse?
//    var comments: JSONNull?
    var likeCount, diamondCount: Int?
    var postEntryReaderState: PostEntryReaderState?
    var isPinned: Bool?
    var postExtraData: PostExtraData?
    var commentCount, recloutCount: Int?
//    var parentPosts: [JSONAny]?
    var diamondsFromSender: Int?

    enum CodingKeys: String, CodingKey {
        case postHashHex = "PostHashHex"
        case posterPublicKeyBase58Check = "PosterPublicKeyBase58Check"
        case parentStakeID = "ParentStakeID"
        case body = "Body"
        case imageURLs = "ImageURLs"
//        case recloutedPostEntryResponse = "RecloutedPostEntryResponse"
        case creatorBasisPoints = "CreatorBasisPoints"
        case stakeMultipleBasisPoints = "StakeMultipleBasisPoints"
        case timestampNanos = "TimestampNanos"
        case isHidden = "IsHidden"
        case confirmationBlockHeight = "ConfirmationBlockHeight"
        case inMempool = "InMempool"
        case stakeEntry = "StakeEntry"
        case stakeEntryStats = "StakeEntryStats"
        case profileEntryResponse = "ProfileEntryResponse"
//        case comments = "Comments"
        case likeCount = "LikeCount"
        case diamondCount = "DiamondCount"
        case postEntryReaderState = "PostEntryReaderState"
        case isPinned = "IsPinned"
        case postExtraData = "PostExtraData"
        case commentCount = "CommentCount"
        case recloutCount = "RecloutCount"
//        case parentPosts = "ParentPosts"
        case diamondsFromSender = "DiamondsFromSender"
    }
}

// MARK: - PostEntryReaderState
struct PostEntryReaderState: Decodable {
    var likedByReader: Bool?
    var diamondLevelBestowed: Int?
    var recloutedByReader: Bool?
    var recloutPostHashHex: String?

    enum CodingKeys: String, CodingKey {
        case likedByReader = "LikedByReader"
        case diamondLevelBestowed = "DiamondLevelBestowed"
        case recloutedByReader = "RecloutedByReader"
        case recloutPostHashHex = "RecloutPostHashHex"
    }
}

// MARK: - PostExtraData
struct PostExtraData: Decodable {
}

// MARK: - ProfileEntryResponse
struct ProfileEntryResponse: Decodable {
    var publicKeyBase58Check, username, profileEntryResponseDescription, profilePic: String?
    var isHidden, isReserved, isVerified: Bool?
//    var comments, posts: JSONNull?
    var coinEntry: CoinEntry?
    var coinPriceBitCloutNanos, stakeMultipleBasisPoints: Int?
    var stakeEntryStats: StakeEntryStats?
//    var usersThatHODL: JSONNull?

    enum CodingKeys: String, CodingKey {
        case publicKeyBase58Check = "PublicKeyBase58Check"
        case username = "Username"
        case profileEntryResponseDescription = "Description"
        case profilePic = "ProfilePic"
        case isHidden = "IsHidden"
        case isReserved = "IsReserved"
        case isVerified = "IsVerified"
//        case comments = "Comments"
//        case posts = "Posts"
        case coinEntry = "CoinEntry"
        case coinPriceBitCloutNanos = "CoinPriceBitCloutNanos"
        case stakeMultipleBasisPoints = "StakeMultipleBasisPoints"
        case stakeEntryStats = "StakeEntryStats"
//        case usersThatHODL = "UsersThatHODL"
    }
}

// MARK: - CoinEntry
struct CoinEntry: Decodable {
    var creatorBasisPoints, bitCloutLockedNanos, numberOfHolders, coinsInCirculationNanos: Int?
    var coinWatermarkNanos: Int?

    enum CodingKeys: String, CodingKey {
        case creatorBasisPoints = "CreatorBasisPoints"
        case bitCloutLockedNanos = "BitCloutLockedNanos"
        case numberOfHolders = "NumberOfHolders"
        case coinsInCirculationNanos = "CoinsInCirculationNanos"
        case coinWatermarkNanos = "CoinWatermarkNanos"
    }
}

// MARK: - StakeEntryStats
struct StakeEntryStats: Decodable {
    var totalStakeNanos, totalStakeOwedNanos, totalCreatorEarningsNanos, totalFeesBurnedNanos: Int?
    var totalPostStakeNanos: Int?

    enum CodingKeys: String, CodingKey {
        case totalStakeNanos = "TotalStakeNanos"
        case totalStakeOwedNanos = "TotalStakeOwedNanos"
        case totalCreatorEarningsNanos = "TotalCreatorEarningsNanos"
        case totalFeesBurnedNanos = "TotalFeesBurnedNanos"
        case totalPostStakeNanos = "TotalPostStakeNanos"
    }
}

// MARK: - StakeEntry
struct StakeEntry: Decodable {
    var totalPostStake: Int?
//    var stakeList: [JSONAny]?

    enum CodingKeys: String, CodingKey {
        case totalPostStake = "TotalPostStake"
//        case stakeList = "StakeList"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Decodable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}




