//
//  Applicant.swift
//  SIRIUS
//
//  Created by Mac-LAB on 9/8/26.
//

import Foundation
import UIKit                // for UIImage

struct Applicant {
    var id = UUID()
    var firstName: String
    var middleName: String
    var lastName: String
    var contactNumber: String
    var location: String
    var program: String
    var yrExp: Double
    var coreLang: [String]
    var workSetUp: String

    var email: String
    var password: String
    
    var profilePicture: UIImage? = nil          // to temporarily store the selected photoensure that the pfp is not optional, if no picture yet, display Image(systemName: "person")
}
