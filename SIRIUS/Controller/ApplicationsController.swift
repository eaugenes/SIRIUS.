//
//  ApplicationsController.swift
//  SIRIUS
//
//  Created by Mac-LAB on 9/15/26.
//

import Foundation
import Combine

class ApplicationsController: ObservableObject {
    @Published var selectedStatus: ApplicationStatus = .all
    
    private var allApplications: [JobApplication] = [
        JobApplication(role: "UI/UX Designer", company: "ABC Company", dateApplied: "September 01, 2026", status: .applied),
        JobApplication(role: "UI/UX Designer", company: "ABC Company", dateApplied: "August 28, 2026", status: .interview),
        JobApplication(role: "UI/UX Designer", company: "ABC Company", dateApplied: "August 20, 2026", status: .accepted),
        JobApplication(role: "UI/UX Designer", company: "ABC Company", dateApplied: "August 27, 2026", status: .rejected)
    ]
    
    var filteredApplications: [JobApplication] {
        if selectedStatus == .all {
            return allApplications
        } else {
            return allApplications.filter { $0.status == selectedStatus }
        }
    }
}
