//
//  ApplicantController.swift
//  SIRIUS
//
//  Created by Mac-LAB on 9/11/26.
//

import Foundation
import Combine          // for ObservableObject and @Published
import UIKit            // UIImage()

class ApplicantController: ObservableObject{
    
    @Published var applicant: Applicant
    
    init(applicant: Applicant) {
        self.applicant = applicant
    }
    
    func updateProfile(_ image: UIImage) {
        applicant.profilePicture = image
    }
}
