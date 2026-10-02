//
//  Interview.swift
//  SIRIUS
//
//  Created by Mac-LAB on 10/2/26.
//

import Foundation

struct Interview: Identifiable {
    let id = UUID()
    var applicantID: UUID
    var date: Date
    var location: String
    var message: String
}
