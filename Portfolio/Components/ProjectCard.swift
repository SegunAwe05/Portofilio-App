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
            }.frame(width: 320, height: 130, alignment: .topLeading)
                
        }.frame(width: 350, height: 150)
            .padding(5)
            .background(Color.purple.opacity(0.4))
            .cornerRadius(10)
    }
}

struct ProjectCard_Previews: PreviewProvider {
    static var previews: some View {
        ProjectCard(title: "Planet Terp", description: "Based on https://planetterp.com/ which is a Professor review site for professors at the University of Maryland to benefit UMD Terps")
    }
}
