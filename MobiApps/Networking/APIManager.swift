//
//  APIManager.swift
//  MobiApps
//
//  Created by Ahmed K on 06/03/2017.
//  Copyright © 2017 Ahmed K. All rights reserved.
//

import UIKit
import Alamofire


class APIManager {
    private init() { }
}

//MARK:
extension APIManager {
    static func getMovies( _ page: Int, _ completion: ResultBlock<[Movie]>? = nil) {
        let params = ["page": page]
        RequestManager(endPoint: "discover/movie", params).getObjects() { (result: Result<[Movie]>) in
            completion?(result)
        }
    }
}


