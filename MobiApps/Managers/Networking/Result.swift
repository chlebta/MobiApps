//
//  Result.swift
//  MobiApps
//
//  Created by Ahmed K on 19/05/2017.
//  Copyright © 2017 Ahmed K. All rights reserved.
//


//
typealias ResultBlock<T> =  (Result<T>) -> Void


/**
 Represents the result of an asynchronous call.
 Can be either a successfull result containing a return value, or a failure containing an error.
 */
public enum Result<T> {
    case failure(Error)
    case success(T)
    
    /** The value, if successful */
    var value: T? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }
    
    /** The error, if unsuccessful */
    public var error: Error? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
    
    /**
     Transform the result value, or propagate any errors gracefully.
     
     This can be used to transform the result without having to verify its content. Any thrown errors will be propagated
     
     - parameters:
     - transform: the closure used to transform the original value
     
     - returns: a result with the transformed value, or the original error
     */
    public func transform<NewValue>(with transformer: (T) throws -> NewValue) -> Result<NewValue> {
        switch self {
        case .success(let value):
            
            do {
                let transformedValue = try transformer(value)
                
                return .success(transformedValue)
            }
            catch(let error) {
                return .failure(error)
            }
        case .failure(let error):
            return .failure(error)
        }
    }
}

