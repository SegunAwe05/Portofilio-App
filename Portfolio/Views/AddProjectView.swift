//
//  AddProjectView.swift
//  Portfolio
//
//  Created by Segun Awe on 1/8/22.
//

import SwiftUI

struct AddProjectView: View {
    var body: some View {
        ZStack {
            Color("Phoric").edgesIgnoringSafeArea(.all)
            VStack {
                Capsule()
                    .foregroundColor(.gray)
                    .frame(width: 100, height: 7)
                    .padding(.top)
                
                Text("Add Your Project!")
                    .foregroundColor(.primary)
                    .font(.title)
                Spacer()
                
            }
        }
    }
}

struct AddProjectView_Previews: PreviewProvider {
    static var previews: some View {
        AddProjectView()
    }
}
