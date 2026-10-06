//
//  EmpInfoController.swift
//  SIRIUS
//
//  Created by Mac-LAB on 10/2/26.
//

import Foundation
import Combine
import UIKit

final class EmpInfoController: ObservableObject {
    
    @Published var employer: Employer
    @Published var company: Company
    @Published var recentActivity: [EmpActivity]
    @Published var isRegistered: Bool = false
    @Published var signUpError: String?
    
    init(
        employer: Employer = Employer(),
        company: Company = Company(),
        recentActivity: [EmpActivity] = EmpInfoController.sampleActivity
    ) {
        self.employer = employer
        self.company = company
        self.recentActivity = recentActivity
    }
    
    // MARK: - Display helpers
    
    var displayCompanyName: String {
        let name = company.cmpName.trimmingCharacters(in: .whitespacesAndNewlines)
        return name.isEmpty ? "Your Company" : name
    }
    
    var companyInitial: String {
        String(displayCompanyName.prefix(1)).uppercased()
    }
    
    // MARK: - Sign up

    // Called by the Finish Sign Up screen. Returns true when registration succeeded.
    func completeSignUp(confirmPassword: String) -> Bool {
        let username = employer.username.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if username.isEmpty {
            signUpError = "Please enter a username."
            return false
        }
        if employer.password.isEmpty {
            signUpError = "Please enter a password."
            return false
        }
        if employer.password != confirmPassword {
            signUpError = "Passwords do not match."
            return false
        }
        
        employer.username = username
        signUpError = nil
        isRegistered = true
        return true
    }
    
    func signOut() {
        isRegistered = false
    }
    
    // MARK: - Sample data
    
    static let sampleActivity: [EmpActivity] = [
        EmpActivity(icon: "person.2", title: "2 New Applicants", jobPosition: "Junior Software Developer", timeAgo: "2 hours ago"),
        EmpActivity(icon: "briefcase", title: "3 Hire Left", jobPosition: "UI/UX Designer", timeAgo: "5 hours ago"),
        EmpActivity(icon: "person.2", title: "5 New Applicants", jobPosition: "UI/UX Designer", timeAgo: "9 hours ago"),
        EmpActivity(icon: "person.2", title: "8 New Applicants", jobPosition: "UI/UX Designer", timeAgo: "1 day ago"),
        EmpActivity(icon: "briefcase", title: "1 Hire Left", jobPosition: "UI/UX Designer", timeAgo: "2 days ago")
    ]
    
    // Pre-filled controller for previews
    static func sample() -> EmpInfoController {
        EmpInfoController(
            employer: Employer(firstName: "Sam", lastName: "Reyes"),
            company: Company(
                cmpName: "ABC Company",
                cmpDesc: "ABC Technologies is a leading software development company based in Quezon City. We specialize in enterprise web applications, mobile development, and cloud solutions for businesses across Southeast Asia. We deliver scalable, secure digital transformation that helps businesses optimize operations and accelerate growth.",
                loc: "Lucena City",
                founded: "2015",
                email: "email@gmail.com",
                website: "ABCtech.com.ph"
            )
        )
    }
}
