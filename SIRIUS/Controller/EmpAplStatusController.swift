//
//  EmpAplStatusController.swift
//  SIRIUS
//
//  Created by Mac-LAB on 10/6/26.
//

import Foundation
import Combine

// Temporary in-memory applicant + interview storage for the employer side.
final class EmpAplStatusController: ObservableObject {
    
    @Published var applicants: [EmpApplicant]
    @Published var interviews: [Interview] = []
    @Published var selectedFilter: EmpApplicantFilter = .all
    @Published var selectedApplicantID: UUID?
    
    // Navigation-related state: non-nil while the Schedule Interview modal is open
    @Published var interviewTarget: EmpApplicant?
    
    init(applicants: [EmpApplicant] = EmpAplStatusController.sampleApplicants) {
        self.applicants = applicants
    }
    
    // MARK: - Filtering / counts
    
    var filteredApplicants: [EmpApplicant] {
        guard let status = selectedFilter.status else { return applicants }
        return applicants.filter { $0.status == status }
    }
    
    var totalCount: Int { applicants.count }
    var toReviewCount: Int { applicants.filter { $0.status == .toReview }.count }
    var interviewCount: Int { applicants.filter { $0.status == .interview }.count }
    var hiredCount: Int { applicants.filter { $0.status == .hired }.count }
    
    var averageMatch: Int {
        guard !applicants.isEmpty else { return 0 }
        let total = applicants.reduce(0) { $0 + $1.matchPercentage }
        return Int((Double(total) / Double(applicants.count)).rounded())
    }
    
    // MARK: - Selection
    
    func isSelected(_ applicant: EmpApplicant) -> Bool {
        selectedApplicantID == applicant.id
    }
    
    func toggleSelection(_ applicant: EmpApplicant) {
        selectedApplicantID = isSelected(applicant) ? nil : applicant.id
    }
    
    // MARK: - Remove
    
    func removeApplicant(_ applicant: EmpApplicant) {
        applicants.removeAll { $0.id == applicant.id }
        interviews.removeAll { $0.applicantID == applicant.id }
        if selectedApplicantID == applicant.id {
            selectedApplicantID = nil
        }
    }
    
    // MARK: - Interview scheduling
    
    func beginScheduling(_ applicant: EmpApplicant) {
        interviewTarget = applicant
    }
    
    func cancelScheduling() {
        interviewTarget = nil
    }
    
    // Saves the interview, moves the applicant to Interview, closes the modal.
    func scheduleInterview(date: Date, location: String, message: String) {
        guard let target = interviewTarget else { return }
        
        interviews.append(
            Interview(applicantID: target.id, date: date, location: location, message: message)
        )
        
        if let index = applicants.firstIndex(where: { $0.id == target.id }) {
            applicants[index].status = .interview
        }
        
        interviewTarget = nil
        selectedApplicantID = nil
    }
    
    // MARK: - Sample data
    
    static let sampleApplicants: [EmpApplicant] = [
        EmpApplicant(name: "Debbie Gutierrez", degree: "BS Computer Science", yearsExperience: 2, coreLanguages: ["Python", "JavaScript", "C++"], matchPercentage: 95, status: .toReview),
        EmpApplicant(name: "Althea Goose", degree: "BS Computer Science", yearsExperience: 2, coreLanguages: ["Python", "JavaScript", "C++"], matchPercentage: 90, status: .toReview),
        EmpApplicant(name: "Luis Slurpia", degree: "BS Computer Science", yearsExperience: 2, coreLanguages: ["Python", "JavaScript", "C++"], matchPercentage: 85, status: .interview),
        EmpApplicant(name: "Kyle Buendia", degree: "BS Computer Science", yearsExperience: 2, coreLanguages: ["Python", "JavaScript", "C++"], matchPercentage: 92, status: .toReview),
        EmpApplicant(name: "Mary Gardenia", degree: "BS Computer Science", yearsExperience: 2, coreLanguages: ["Python", "JavaScript", "C++"], matchPercentage: 88, status: .hired),
        EmpApplicant(name: "Mico Comartin", degree: "BS Computer Science", yearsExperience: 2, coreLanguages: ["Python", "JavaScript", "C++"], matchPercentage: 90, status: .toReview)
    ]
}
