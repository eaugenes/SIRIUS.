//
//  EmployerApplicantStatus.swift
//  SIRIUS
//
//  Created by Mac-LAB on 10/2/26.
//

import Foundation

enum EmployerApplicantStatus: String, CaseIterable, Identifiable {
    case toReview = "To Review"
    case interview = "Interview"
    case hired = "Hired"
    
    var id: String { self.rawValue }
}

enum EmployerApplicantFilter: String, CaseIterable, Identifiable {
    case all = "All"
    case toReview = "To Review"
    case interview = "Interview"
    case hired = "Hired"
    
    var id: String { self.rawValue }
    
    
    var status: EmployerApplicantStatus? {
        switch self {
        case .all: return nil
        case .toReview: return .toReview
        case .interview: return .interview
        case .hired: return .hired
        }
    }
}


struct EmployerApplicant: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var degree: String
    var yearsExperience: Int
    var coreLanguages: [String]
    var matchPercentage: Int
    var status: EmployerApplicantStatus = .toReview
}
