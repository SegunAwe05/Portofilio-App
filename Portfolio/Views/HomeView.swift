//
//  HomeView.swift
//  Portfolio
//
//  Created by Segun Awe on 1/1/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = TodoVM()
    @State var showTodo = false
    @State var showIdea = false
    
    var body: some View {
        ZStack {
            Color("Phoric").edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    showIdea = false
                    showTodo = false
                }
            VStack(spacing: 20) {
                Text("Portfolio")
                    .foregroundColor(.primary)
                    .font(.largeTitle)
                
                VStack(alignment: .leading, spacing: 10) {
                    Image(systemName: "person").foregroundColor(Color("Phoric"))
                        .font(.system(size: 60))
                        .background(.pink)
                        .clipShape(Circle())
                    
                    Text("Welcome, Segun")
                        .foregroundColor(.primary)
                        .font(.title3)
                        .frame(width: 150)
                        .padding(.trailing, 230)
                }.frame(maxWidth: .infinity)
                    .padding(5)
                Divider()
                
                HStack {
                    Text("To do ")
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                    Button {
                        showTodo.toggle()
                    } label: {
                        ButtonView()
                    }
                }.padding(5)
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(1..<10) { mod in
                            SmallCard(subject: "career", title: "Update resume")
                        }
                    }
                }
                
                HStack {
                    Text("Ideas")
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                    Button {
                        showIdea.toggle()
                    } label: {
                        ButtonView()
                    }
                }.padding(5)
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(1..<10) { mod in
                            SmallCard(subject: "App", title: "Weather App")
                        }
                    }
                }
              
                
                Spacer()
            }
          
            
//            .sheet(isPresented: $showTodo) {
//                AddTodoView()
//            }
//            .sheet(isPresented: $showIdea) {
//                AddIdeasView(vm: vm)
//            }
            
            if showIdea {
                AddIdeasView(vm: vm, showIdea: $showIdea)
            }

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
