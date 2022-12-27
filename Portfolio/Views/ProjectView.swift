//
//  ProjectView.swift
//  Portfolio
//
//  Created by Segun Awe on 1/13/22.
//

import SwiftUI
import CoreData
import AVKit


struct ProjectView: View {
    var title: String
    var imgNum: Int16
    var descriptionTxt: String
    var pracImages: [String] = ["myImg1", "myImg2"]
    var hexColor: String
    var git: String
    var videoLink: String!
    @State var player = AVPlayer()
    @State var readMe = false
    @ObservedObject var vm: ProjectsVM
    @Environment( \.presentationMode) var goBack
    
    var body: some View {
        ZStack {
            
            if(vm.imgData.isEmpty) {
                ProgressView().progressViewStyle(CircularProgressViewStyle())
            } else {
                ScrollView {
                    TabView {
                        ForEach(vm.imgData, id: \.self) { mod in
                            //  Image(mod)
                            Image(uiImage: mod)
                                .resizable()
                                .scaledToFill()
                        }
                        // place video player here
                        VideoPlayer(player: player)
                    }
                    .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height)
                    .tabViewStyle(PageTabViewStyle())
                }
            }
            
            // the button
            VStack{
                Spacer().frame(height: 50)
                HStack {
                    Button {
                        self.goBack.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                    }.padding(8)
                        .background(Color(UIColor(hexString: hexColor)).opacity(0.4))
                        .clipShape(Circle())
                    Spacer()
                }.padding(8)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        readMe.toggle()
                    } label: {
                        Image(systemName: "book")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                    }.padding(8)
                        .background(Color(UIColor(hexString: hexColor)).opacity(0.4))
                        .clipShape(Circle())
                }.padding(8)
            }.padding(.bottom, 20)
            
            if readMe {
                readmeView(title: title, descrip: descriptionTxt, githubLink: git, readMe: $readMe)
                
            }
            
            
        } .edgesIgnoringSafeArea(.all)
        
            .onAppear() {
                vm.retImage(title: title, num: imgNum)
                player = AVPlayer(url: URL(string: videoLink)!)
                player.play()
                
                
                
                
            }
            .onDisappear() {
                vm.imgData.removeAll()
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        
        
    }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView(title: "Segun Awe", imgNum: 4, descriptionTxt: "Based on https://planetterp.com/ which is a Professor review site for professors at the University of Maryland to benefit UMD Terps. Fully Swiftui, API Calls to get data", hexColor: "#0000FF", git: "link", vm: ProjectsVM())
            .preferredColorScheme(.light)
//        ProjectView(title: "Segun Awe", imgNum: 4, descriptionTxt: "Based on https://planetterp.com/ which is a Professor review site for professors at the University of Maryland to benefit UMD Terps. Fully Swiftui, API Calls to get data", hexColor: "#0000FF", git: "link", vm: ProjectsVM())
//            .preferredColorScheme(.dark)

    }
}
