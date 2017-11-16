//
//  RequestHelper.swift
//  MobiApps
//
//  Created by Ahmed K on 06/03/2017.
//  Copyright © 2017 Ahmed K. All rights reserved.
//

import Foundation
import Alamofire
import SystemConfiguration


class RequestHelper {

    fileprivate var url: String
    fileprivate var method: Alamofire.HTTPMethod
    fileprivate var parameters: [String : Any]?


    init(url: String, method : Alamofire.HTTPMethod? = nil, parameters: [String : Any]? = nil) {
        self.url = url
        self.method = method ?? .get
        self.parameters = parameters
    }

}

//MARK: Actions
extension RequestHelper {

    func responseJSON(_ result: ResultBlock<Any?>? = nil) {
        
        Alamofire.request(self.url, method: self.method, parameters: parameters)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    //
                    result?(Result.success(response.result.value))

                case .failure(let error):

                    // Check if it's not connection issue
                    if let error = error as? URLError,
                        error.code  == URLError.Code.notConnectedToInternet {
                        result?(Result.failure(NetworkError.offline))
                    }
                    else {
                        let code = response.response?.statusCode ?? 0
                        result?(Result.failure(NetworkError(code)))

                    }

                }
        }
    }
}


