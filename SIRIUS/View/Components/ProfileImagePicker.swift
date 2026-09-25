//
//  ProfileImagePicker.swift
//  SIRIUS
//
//  Created by Mac-LAB on 9/11/26.
//

import SwiftUI
import UIKit
import PhotosUI         // for PhotosPickerItem to show the photo the user selected from album

struct ProfileImagePicker: View {
    
    @Binding var image: UIImage?
    @State private var showImageOptions: Bool = false
    @State private var showPhotoAlbum: Bool = false
    @State private var showCamera: Bool = false
    @State private var selectedOption: PhotosPickerItem?
    
    
    var body: some View {
        ZStack{
            Group{      //      Group{} - Invisible container for switching images
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                } else {
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .padding(30)
                        .frame(width: 100, height: 100)
                }
            }
            .frame(width: 120, height: 120)
            .background(
                Color(
                    red: 3 / 255,
                    green: 82 / 255,
                    blue: 123 / 255
                )
            )
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.white, lineWidth: 3)
            )
            .shadow(radius: 4)
            .overlay(
                Button {
                    showImageOptions = true
                } label: {
                    Image(systemName: "camera.fill")
                        .font(.system(size: 15))
                        .foregroundStyle(Color.white)
                        .frame(width: 50, height: 50)
                        .background(
                            Color(
                                red: 3 / 255,
                                green: 82 / 255,
                                blue: 123 / 255
                            )
                        )
                        .clipShape(Circle())
                }
                    .offset(x: 40, y: 40)
            )
        }
        .photosPicker(
            isPresented: $showImageOptions,
            selection: $selectedOption,
            matching: .images
        )
        
        .sheet(isPresented: $showCamera) {
            CameraView(image: $image)
        }
        
        .onChange(of: selectedOption) { oldValue, newValue in
                    Task {
                        if let data = try? await newValue?.loadTransferable(type: Data.self),
                           let uiImage = UIImage(data: data) {
                                image = uiImage
                        }
                    }
                }
    }
}
