//
//  RequestManager.swift
//  MobiApps
//
//  Created by Ahmed K on 18/05/2017.
//  Copyright © 2017 Ahmed K. All rights reserved.
//

import Foundation

typealias SuccessResponseManager = (_ success: Bool, _ error: NetworkError?) -> Void


class RequestManager{

    private let apiUrl:String  =  "https://api.themoviedb.org/3/"

    var url = ""

    init(endPoint: String) {
        url = apiUrl + endPoint + "?api_key=80e05b40cdb4126029378d190074f084"
    }


    
}

//MARK: ---
//MARK: GET
extension RequestManager {
    // Get a list of objects
    func getObjects<T: GenericModel>(_ completionBlock: ResultBlock<[T]>? = nil ){
        
        RequestHelper(url: self.url).responseJSON { result in
            
            switch result
            {
            case .success(let value):
                guard let json = value as? [String: Any],
                    let results = json["results"] as? [[String: Any]] else {
                        completionBlock?(Result.failure(NetworkError.invalideResponse))
                        return
                }
                // Convert objects to an array of excpected struct
                let objects:[T] = results.flatMap({ item -> T? in
                    return T(item)
                })
                
                completionBlock?(Result.success(objects))

            case .failure(let error) :
                completionBlock?(Result.failure(error))
            }
        }
    }
}


