//
//  NetworkError.swift
//  MobiApps
//
//  Created by Ahmed K on 19/05/2017.
//  Copyright © 2017 Ahmed K. All rights reserved.
//


enum NetworkError: Int, Error {
    
    case invalidCredentials     = 401
    case invalidId              = 404
    case invalidParams          = 422
    case serverError            = 500

    case invalideResponse
    case offline
    case unknown

    var code: Int { return self.rawValue }
 
    var localizedDescription : String {
        switch self {
        case .unknown:
            return "Unknown error"
        case .offline:
            return "No internet connection"
        case .serverError:
            return "Server error"
        case .invalidParams:
            return "Invalid parameters: Your request parameters are incorrect."
        case .invalidCredentials:
            return "Authentication failed: You do not have permissions to access the service."
        case .invalidId:
            return "Invalid id: The pre-requisite id is invalid or not found"
        case .invalideResponse:
            return "The response format is not as expected"
        }
    }
    
    init(_ code: Int) {
        switch code
        {
        case 401:
            self = .invalidCredentials
        case 404:
            self = .invalidId
        case 422:
            self = .invalidParams
        case 500...510:
            self = .serverError
        default:
            self = .unknown

        }
    }
}
