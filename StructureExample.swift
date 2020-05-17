//
//  StructureExample.swift
//  SE-Example
//
//  Created by Niclas Schmuck on 17.05.20.
//  Copyright © 2020 Niclas Schmuck. All rights reserved.
//

import Foundation

struct Person : Codable {
    var name : String
    var address : Address
    var email : String
}

struct Address : Codable {
    var street : String
    var town : String
    var postal : String
}


