//
//  City.swift
//  SIRIUS
//
//  Created by Mac-LAB on 9/10/26.
//

import Foundation

struct City: Identifiable, Codable, Hashable {
    let id: Int
    let name: String
}

//      Hashable - for data to be used in a set and be used for multi-selection
