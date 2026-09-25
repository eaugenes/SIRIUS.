//
//  AplSignUpView.swift
//  SIRIUS
//
//  Created by Mac-LAB on 9/8/26.
//

import SwiftUI

struct AplSignUpPage: View {
    
    @StateObject private var applicantController = ApplicantController(
        applicant: Applicant(
           firstName: "", middleName: "", lastName: "", contactNumber: "", location: "", program: "", yrExp: 0.0, coreLang: [""], workSetUp: "", email: "", password: ""
        )
            
    )
    @StateObject private var cityController = CitySelectionController()
    
    @State private var firstName = ""
    @State private var middleName = ""
    @State private var lastName = ""
    @State private var birthDate = ""
    @State private var contactNum = ""
    @State private var location = ""
    @State private var program = ""
    @State private var yrExp = ""
    @State private var coreLang = ""
    @State private var workSetUp = ""
    
    @State private var backScreen = false
    @State private var nextScreen = false
    
    var body: some View {
        NavigationStack{
            VStack{
                ZStack{
                    HStack{
                        Button{
                            backScreen = true
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 20))
                                .foregroundStyle(Color.black)
                        }
                        
                        Spacer()
                        
                        Text("Personal Information")
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                        
                        Spacer()
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 50)
                
                ProfileImagePicker(
                    image: $applicantController.applicant.profilePicture
                )
                
                AppTextField(
                    title: "First Name",
                    placeholder: "Enter your first name",
                    text: $firstName,
                    isSecure: false
                )
                
                AppTextField(
                    title: "Middle Name",
                    placeholder: "Enter your middle name",
                    text: $middleName,
                    isSecure: false
                )
                
                AppTextField(
                    title: "Last Name",
                    placeholder: "Enter your last name",
                    text: $lastName,
                    isSecure: false
                )
                
                AppTextField(
                    title: "Date of Birth",
                    placeholder: "YYYY-MM-DD",
                    text: $birthDate,
                    isSecure: false
                )
                
                AppTextField(
                    title: "Contact Number",
                    placeholder: "Enter your contact number",
                    text: $contactNum,
                    isSecure: false
                )
                
                CitiesDropdown(
                    title: "Location",
                    cities: cityController.cities,
                    selectedCity: $cityController.selectedCity
                )
                .zIndex(1)
                
                
                
                // Dropdown/picker educ
                // Stepper Years of Experience
                
                AppTextField(
                    title: "Core Languages",
                    placeholder: "e.g., Python, C++",
                    text: $coreLang,
                    isSecure: false
                )
                
                // picker work setup
                
                Button {
//                    saveData()
                    nextScreen = true
                } label: {
                    Text("Continue")
                        .fontWeight(.regular)
                        .padding(.horizontal, 20)
                        .frame(width: 280, height: 38)
                        .foregroundStyle(Color.white)
                        .background(Color(red: 10/255, green: 85/255, blue: 128/255))
                        .cornerRadius(10)
                        .padding(.top, 50)
                }
            }
            .frame(maxWidth: 370, maxHeight: .infinity)
            .appBg()
            .navigationDestination(isPresented: $backScreen) {
                RoleSelectionPage()
            }
            .navigationDestination(isPresented: $nextScreen) {
                MainTabView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AplSignUpPage()
}
