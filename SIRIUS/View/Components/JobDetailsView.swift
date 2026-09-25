//
//  JobDetailsView.swift
//  SIRIUS
//
//  Created by Mac-LAB on 9/8/26.
//

import SwiftUI

struct JobDetailsView: View {
    
    @State private var backScreen = false
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Button{
                        backScreen = true
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20))
                            .foregroundStyle(Color.black)
                    }
                    .padding(.bottom, 20)
                    
                    Spacer()
                        .frame(maxWidth: 350)
                }
                
                VStack(alignment: .leading){
                    Text("Junior Software Developer")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    Text("OpeniT Philippines, Inc.")
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .foregroundStyle(.white)
                        .padding(.bottom, 6)
                    
                    HStack{
                        HStack{
                            Text("₱18,000 -  ₱25,000")
                                .font(.system(size: 8))
                                .fontWeight(.regular)
                                .foregroundStyle(.black)
                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 5)
                        .frame(width: 110, height: 20)
                        .background(Color.white)
                        .cornerRadius(50)
                        
                        HStack{
                            Text("Lucena City")
                                .font(.system(size: 8))
                                .fontWeight(.regular)
                                .foregroundStyle(.black)
                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 5)
                        .frame(width: 110, height: 20)
                        .background(Color.white)
                        .cornerRadius(50)
                        
                        HStack{
                            Text("On-Site")
                                .font(.system(size: 8))
                                .fontWeight(.regular)
                                .foregroundStyle(.black)
                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 5)
                        .frame(width: 110, height: 20)
                        .background(Color.white)
                        .cornerRadius(50)
                    }
                }
                .padding(.horizontal, 40)
                .padding(.vertical, 15)
                .frame(width: 420, height: 123)
                .background(
                    Color(
                        red: 0/255,
                        green: 61/255,
                        blue: 92/255
                    )
                    .cornerRadius(10)
                    .offset(x: -20)
                )
                .cornerRadius(10)
                
                ScrollView{
                    QualiMatchCard(
                        percentage: "30%",
                        title: "Qualification Match",
                    )
                    .padding(.bottom, 10)
                    
                    VStack(alignment: .leading){
                        Text("Job Description")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .padding(.bottom, 5)
                        
                        Text("We are looking for a talented Junior Software Developer to join our agile team. You will work on building scalable web applications and contribute to the full software development lifecycle alongside senior engineers.")
                            .font(.system(size: 12))
                            .fontWeight(.regular)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 15)
                        
                        Text("Responsibilities")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .padding(.bottom, 5)
                        
                        Text("- Develop and maintain web applications using modern frameworks")
                            .font(.system(size: 12))
                            .fontWeight(.regular)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 5)
                        
                        Text("- Collaborate with cross-functional teams to define and ship features")
                            .font(.system(size: 12))
                            .fontWeight(.regular)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 5)
                        
                        Text("- Write clean, maintainable, and well-documented code")
                            .font(.system(size: 12))
                            .fontWeight(.regular)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 5)
                        
                        Text("- Participate in code reviews and provide constructive feedback")
                            .font(.system(size: 12))
                            .fontWeight(.regular)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 5)
                        
                        Text("- Debug and resolve technical issues across the stack")
                            .font(.system(size: 12))
                            .fontWeight(.regular)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 15)
                        
                        Text("Qualifications")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .padding(.bottom, 5)
                        
                        VStack{
                            HStack{
                                Text("Educational Attainment")
                                    .font(.system(size: 14))
                                    .fontWeight(.regular)
                                    .foregroundStyle(.black)
                                    .padding(.bottom, 2)
                                
                                Spacer()
                            }
                            
                            ScrollView(.horizontal){
                                HStack{
                                    Text("BS Computer Science")
                                        .font(.system(size: 8))
                                        .fontWeight(.regular)
                                        .foregroundStyle(.black)
                                        .frame(width: 120, height: 15)
                                        .background(
                                            .black,
                                            in: RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1))
                                    
                                    Text("BS Information Technology")
                                        .font(.system(size: 8))
                                        .fontWeight(.regular)
                                        .foregroundStyle(.black)
                                        .frame(width: 120, height: 15)
                                        .background(
                                            .black,
                                            in: RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1))
                                    
                                    Text("BS Information Systems")
                                        .font(.system(size: 8))
                                        .fontWeight(.regular)
                                        .foregroundStyle(.black)
                                        .frame(width: 120, height: 15)
                                        .background(
                                            .black,
                                            in: RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1))
                                        
                                }
                            }
                            .frame(width: 270)
                            .clipped()      // To Clip Content
                            
                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .frame(width: 310)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(
                            color: .black.opacity(0.8),
                            radius: 4,
                            x: 0,
                            y: 4
                        )
                        .padding(.bottom, 10)
                        
                        HStack{
                            Text("Minimum Work Experience")
                                .font(.system(size: 14))
                                .fontWeight(.regular)
                                .foregroundStyle(.black)
                            
                            Spacer()
                            
                            Text("2 years")
                                .font(.system(size: 12))
                                .fontWeight(.regular)
                                .foregroundStyle(.black)
                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .frame(width: 310)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(
                            color: .black.opacity(0.8),
                            radius: 4,
                            x: 0,
                            y: 4
                        )
                        .padding(.bottom, 10)
                        
                        VStack{
                            HStack{
                                Text("Core Languages")
                                    .font(.system(size: 14))
                                    .fontWeight(.regular)
                                    .foregroundStyle(.black)
                                    .padding(.bottom, 2)
                                
                                Spacer()
                            }
                            
                            ScrollView(.horizontal){
                                HStack{
                                    Text("Python")
                                        .font(.system(size: 8))
                                        .fontWeight(.regular)
                                        .foregroundStyle(.black)
                                        .frame(width: 100, height: 15)
                                        .background(
                                            .black,
                                            in: RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1))
                                    
                                    Text("JavaScript")
                                        .font(.system(size: 8))
                                        .fontWeight(.regular)
                                        .foregroundStyle(.black)
                                        .frame(width: 100, height: 15)
                                        .background(
                                            .black,
                                            in: RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1))
                                    
                                    Text("C#")
                                        .font(.system(size: 8))
                                        .fontWeight(.regular)
                                        .foregroundStyle(.black)
                                        .frame(width: 100, height: 15)
                                        .background(
                                            .black,
                                            in: RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1))
                                        
                                }
                            }
                            .frame(width: 270)
                            .clipped()
                            
                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .frame(width: 310)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(
                            color: .black.opacity(0.8),
                            radius: 4,
                            x: 0,
                            y: 4
                        )
                    }
                    .padding(.vertical, 20)
                    .padding(.horizontal, 30)
                    .frame(width: 360)
                    .background(
                        Color(
                            red: 0/255,
                            green: 61/255,
                            blue: 92/255
                        )
                    )
                    .cornerRadius(15)
                }
            }
            .appBg()
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $backScreen) {
                MainTabView()
            }
        }
    }
}

#Preview {
    JobDetailsView()
}
