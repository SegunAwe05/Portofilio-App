//
//  AddProjectView.swift
//  Portfolio
//
//  Created by Segun Awe on 1/8/22.
//

import SwiftUI
import AVKit
import PhotosUI
import UIKit.UIColor

struct AddProjectView: View {
    @ObservedObject var vm: ProjectsVM
    @State var title = ""
    @State var projectDescription = ""
    @State var git = ""
    @State var videoLink = ""
    @State var cardColor = Color.purple
    //@State var selectedImages: UIImage = UIImage(systemName: "person")!
    @State var selectedImages: [UIImage] = []
    @State var showPhp = false
    @State var colorHex = ""
    @State var imgNum: Int16 = 0
    @Binding var showAddProject: Bool
    @Binding var isProjectAdded: Bool

    var pickerConfiguration: PHPickerConfiguration {
          var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
          config.filter = .images
          config.selectionLimit = 5
          return config
        }
    var body: some View {
        ZStack {
            Color("Phoric").edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
            VStack(spacing: 25) {
                Capsule()
                    .foregroundColor(.gray)
                    .frame(width: 70, height: 7)
                    .padding(.top)
                
                Text("Add Your Project!")
                    .foregroundColor(.primary)
                    .font(.title)
                
                ColorPicker("Select a color for your project card!", selection: $cardColor)
                    .padding(5)
                TextField("Project Title", text: $title)
                    .frame(width: 350, height: 35)
                    .padding(5)
                    .background(Color("CardBack"))
                    .cornerRadius(10)
                TextField("Project Description", text: $projectDescription)
                    .frame(width: 350, height: 35)
                    .padding(5)
                    .background(Color("CardBack"))
                    .cornerRadius(10)
                TextField("Repository Link", text: $git)
                    .frame(width: 350, height: 35)
                    .padding(5)
                    .background(Color("CardBack"))
                    .cornerRadius(10)
                TextField("Video Link", text: $videoLink)
                    .frame(width: 350, height: 35)
                    .padding(5)
                    .background(Color("CardBack"))
                    .cornerRadius(10)
                Button {
                    showPhp = true
                } label: {
                    Label("Pick your Images", systemImage: "camera")
                        .foregroundColor(.primary)
                        .frame(width: 350, height: 35)
                        .padding(5)
                        .background(Color("CardBack"))
                        .cornerRadius(10)
                }
                
                Button {
                    if !title.isEmpty && !projectDescription.isEmpty && !git.isEmpty && !videoLink.isEmpty {
                        let colorRGB = UIColor(cardColor)
                        colorHex = colorRGB.toHexString()
                        vm.addProject(titleTxt: title, videoTxt: videoLink, projectDescripTxt: projectDescription, cardColorTxt: colorHex, github: git, picturesData: selectedImages, imgNumber: imgNum)
                        title = ""
                        videoLink = ""
                        projectDescription = ""
                        git = ""
                        selectedImages = []
                        imgNum = 0
                        showAddProject = false
                        isProjectAdded.toggle()
                    }
                } label: {
                    Label("Add Project", systemImage: "checkmark.circle")
                        .foregroundColor(.primary)
                        .frame(width: 180, height: 25)
                        .padding(5)
                        .background(Color("CardBack"))
                        .cornerRadius(10)
                }

                Spacer()
                
            }
            .sheet(isPresented: $showPhp) {
                PhotoPicker(configuration: pickerConfiguration, showPhp: $showPhp, selectedImages: $selectedImages, imgNum: $imgNum)
                   }
        }
    }
}

struct AddProjectView_Previews: PreviewProvider {
    static var previews: some View {
        AddProjectView(vm: ProjectsVM(), showAddProject: .constant(false), isProjectAdded: .constant(false))
    }
}
