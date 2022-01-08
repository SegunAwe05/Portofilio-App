//
//  smallCard.swift
//  Portfolio
//
//  Created by Segun Awe on 1/3/22.
//

import SwiftUI

struct SmallCardTodo: View {
    var subject: String
    var title: String
    @State var isDelete = false
    @ObservedObject var vm: TodoVM
    @Binding var showDeleted: Bool
    var body: some View {
        ZStack {
        RoundedRectangle(cornerRadius: 15.0)
            .frame(width: 140, height: 150)
            .foregroundColor(Color("CardBack"))
            .onTapGesture(count: 2) {
                isDelete = false
            }
            .onLongPressGesture {
                isDelete = true
            }
           
            VStack(alignment: .leading) {
                
                HStack {
                Spacer().frame(width: 105)
                    if isDelete {
                        Button {
                            vm.deleteTodo(titleTxt: title)
                            showDeleted.toggle()
                        } label: {
                            Image(systemName: "x.circle.fill").opacity(0.6)
                            .foregroundColor(.red)
                            .padding(3)
                    }
                    } else if isDelete == false {
                        /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                    }
                }
                    
                Text(subject)
                    .font(.caption)
                    .foregroundColor(.primary)
                    .frame(width: 120, alignment: .leading)
                    .padding(5)
                Text(title)
                    .foregroundColor(.primary)
                    .frame(width: 120, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .padding(5)
                Spacer().frame(height: 30)
            }
        }
    }
}

struct SmallCardTodo_Previews: PreviewProvider {
    static var previews: some View {
        SmallCardTodo(subject: "Career", title: "Update Resume", vm: TodoVM(), showDeleted: .constant(false))
    }
}
