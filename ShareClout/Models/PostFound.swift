////
////  PostFound.swift
////  ShareClout
////
////  Created by Daniel Kamel on 22/07/2021.
////

import Foundation

struct Cloutington: Decodable {
    
    var postFound: PostFound?
    
    enum CodingKeys: String, CodingKey {
        case postFound = "PostFound"
        
    }
    
}

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
    var profileEntryResponse: ProfileEntryResponse?
    var likeCount, diamondCount: Int?
    var isPinned: Bool?
    var commentCount, recloutCount: Int?
    var diamondsFromSender: Int?
    
    enum CodingKeys: String, CodingKey {
        case postHashHex = "PostHashHex"
        case posterPublicKeyBase58Check = "PosterPublicKeyBase58Check"
        case parentStakeID = "ParentStakeID"
        case body = "Body"
        case imageURLs = "ImageURLs"
        case creatorBasisPoints = "CreatorBasisPoints"
        case stakeMultipleBasisPoints = "StakeMultipleBasisPoints"
        case timestampNanos = "TimestampNanos"
        case isHidden = "IsHidden"
        case confirmationBlockHeight = "ConfirmationBlockHeight"
        case inMempool = "InMempool"
        case profileEntryResponse = "ProfileEntryResponse"
        case likeCount = "LikeCount"
        case diamondCount = "DiamondCount"
        case isPinned = "IsPinned"
        case commentCount = "CommentCount"
        case recloutCount = "RecloutCount"
        case diamondsFromSender = "DiamondsFromSender"
    }
}

// MARK: - ProfileEntryResponse
struct ProfileEntryResponse: Decodable {
    var publicKeyBase58Check, username, profileEntryResponseDescription, profilePic: String?
    var isHidden, isReserved, isVerified: Bool?
    var coinPriceBitCloutNanos, stakeMultipleBasisPoints: Int?
    
    enum CodingKeys: String, CodingKey {
        case publicKeyBase58Check = "PublicKeyBase58Check"
        case username = "Username"
        case profileEntryResponseDescription = "Description"
        case profilePic = "ProfilePic"
        case isHidden = "IsHidden"
        case isReserved = "IsReserved"
        case isVerified = "IsVerified"
        case coinPriceBitCloutNanos = "CoinPriceBitCloutNanos"
        case stakeMultipleBasisPoints = "StakeMultipleBasisPoints"
    }
}

