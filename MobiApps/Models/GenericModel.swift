//
//  GenericModel.swift
//  MobiApps
//
//  Created by Ahmed K on 19/04/2017.
//  Copyright © 2017 Ahmed K. All rights reserved.
//

import Foundation


import Foundation

protocol GenericModel : Codable {
    var id: Int { get }
    init?(_ : Any?)
}

// all objects that conform to this protocol
// will now have default equality based on the
// protocol properties
func ==<T: GenericModel>(lhs: T, rhs: T) -> Bool {
    return lhs.id == rhs.id
}

