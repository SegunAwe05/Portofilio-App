//
//  AddTodoView.swift
//  Portfolio
//
//  Created by Segun Awe on 1/4/22.
//

import SwiftUI

struct AddTodoView: View {
    @ObservedObject var vm: TodoVM
    @State var subject = ""
    @State var title = ""
    @Binding var showTodo: Bool
    var body: some View {
     
        VStack {
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
                        if !subject.isEmpty && !title.isEmpty {
                            vm.addTodo(titleTxt: title, subjectTxt: subject)
                            showTodo.toggle()
                            subject = ""
                            title = ""
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }
                        
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
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            Spacer().frame(height: 210)
        }

  
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView(vm: TodoVM(), showTodo: .constant(false))
    }
}
