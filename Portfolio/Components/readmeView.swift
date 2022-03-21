//
//  readmeView.swift
//  Portfolio
//
//  Created by Segun Awe on 3/20/22.
//

import SwiftUI

struct readmeView: View {
    var title: String
    var descrip: String
    var githubLink: String
    @Binding var readMe: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
                .onTapGesture {
                    readMe.toggle()
                }
            VStack(alignment: .leading, spacing: 20) {
                Spacer().frame(height: 50)
                
                HStack {
                    Text(title)
                        .foregroundColor(.white)
                        .bold()
                        .font(.largeTitle)
                    Spacer()
                }.padding(8)
                
                
                Text("Description: ")
                    .foregroundColor(.white)
                    .bold()
                
                Text(descrip)
                    .foregroundColor(.white)
                
                Text("GitHub repository: ")
                    .foregroundColor(.white)
                    .bold()
                
                Link("\(githubLink)", destination: URL(string: githubLink)!)
                
                
                Spacer()
                
            }  .padding(8)
        }.edgesIgnoringSafeArea(.all)
        
        
    }
}

struct readmeView_Previews: PreviewProvider {
    static var previews: some View {
        readmeView(title: "Planet Terp", descrip: "Based on https://planetterp.com/ which is a Professor review site for professors at the University of Maryland to benefit UMD Terps. Fully Swiftui, API Calls to get data ", githubLink: "https://github.com/SegunAwe05/Planet-Terp", readMe: .constant(true))
    }
}
