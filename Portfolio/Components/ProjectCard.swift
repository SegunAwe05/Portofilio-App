//
//  ProjectCard.swift
//  Portfolio
//
//  Created by Segun Awe on 1/8/22.
//

import SwiftUI

struct ProjectCard: View {
    var title: String
    var description: String
    var hexColor: String
    @ObservedObject var vm: ProjectsVM
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(.primary)
                    .font(.title)
                    .fontWeight(.medium)
                Spacer().frame(height: 10)
                Text(description)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
            }.frame(width: 320, height: 130, alignment: .topLeading)
                
        }.frame(width: 350, height: 150)
            .padding(5)
            .background(Color(UIColor(hexString: hexColor)).opacity(0.4))
            .cornerRadius(15)

            .onTapGesture(count: 2) {
                vm.deleteProject(titleTxt: title)
            }
    }
        
}

struct ProjectCard_Previews: PreviewProvider {
    static var previews: some View {
        ProjectCard(title: "Planet Terp", description: "Based on https://planetterp.com/ which is a Professor review site for professors at the University of Maryland to benefit UMD Terps", hexColor: "#0061fe", vm: ProjectsVM())
    }
}
