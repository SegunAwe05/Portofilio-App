//
//  AddIdeasView.swift
//  Portfolio
//
//  Created by Segun Awe on 1/4/22.
//

import SwiftUI

struct AddIdeasView: View {
    @ObservedObject var vm: TodoVM
    @State var subject = ""
    @State var title = ""
    @Binding var showIdea: Bool
    var body: some View {
        //        ZStack {
        //            //Color("Phoric").edgesIgnoringSafeArea(.all)
        //            Color.clear.edgesIgnoringSafeArea(.all)
        //            VStack {
        //                Capsule()
        //                    .foregroundColor(Color.gray.opacity(0.4))
        //                    .frame(width: 100, height: 5)
        //                    .padding(.top, 10)
        //                Spacer()
        
        VStack {
            VStack(alignment: .leading, spacing: 15) {
                Text("Add Your Ideas!")
                    .foregroundColor(.primary)
                    .font(.title)
                
                
                Text("Add subject").foregroundColor(.primary)
                TextField("", text: $subject)
                    .frame(height: 35)
                    .padding(5)
                    .background(Color("CardBack"))
                    .cornerRadius(10)
                
                
                Text("Add title").foregroundColor(.primary)
                TextField("", text: $title)
                    .frame(height: 35)
                    .padding(5)
                    .background(Color("CardBack"))
                    .cornerRadius(10)
                
                
            }
            Spacer().frame(height: 40)
            HStack (alignment: .center) {
                Button {
                    showIdea.toggle()
                } label: {
                    Text("Add")
                        .foregroundColor(.primary)
                        .frame(width: 100)
                        .padding(5)
                        .background(Color("CardBack"))
                        .cornerRadius(10)
                    
                }
            }
        }.frame(width: 300, height: 400)
            .padding(.horizontal)
            .background(Color("AddColor"))
            .cornerRadius(15.0)

  
    }
}


struct AddIdeasView_Previews: PreviewProvider {
    static var previews: some View {
        AddIdeasView(vm: TodoVM(), showIdea: .constant(true))
    }
}
