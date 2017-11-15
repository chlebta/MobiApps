//
//  APIManager.swift
//  MobiApps
//
//  Created by Norbert Billa on 06/03/2017.
//  Copyright © 2017 Ahmed K. All rights reserved.
//

import UIKit
import Alamofire


class APIManager {
    

    private init() {    }
}

//MARK:
extension APIManager {
    static func getMovies(_ completion: ResultBlock<[Movie]>? = nil) {
        RequestManager(endPoint: "discover/movie").getObjects() { (result: Result<[Movie]>) in
            completion?(result)
        }
    }
}


