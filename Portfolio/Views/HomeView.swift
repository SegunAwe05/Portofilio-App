//
//  HomeView.swift
//  Portfolio
//
//  Created by Segun Awe on 1/1/22.
//

import SwiftUI
import SSToastMessage
struct HomeView: View {
    @StateObject var vm = TodoVM()
    @StateObject var vmProject = ProjectsVM()
    @State var showTodo = false
    @State var showIdea = false
    @State var showDeleted = false
    @State var showAdded = false
    @State var showAddProject = false
    @State var isProjectAdded = false
    @State public var imgTube: Data = .init(count: 0)
    var body: some View {
        ZStack {
            Color("Phoric").edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    showIdea = false
                    showTodo = false
                }
            ScrollView(showsIndicators: false) {
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
                            ForEach(vm.savedData) { mod in
                                SmallCardTodo(subject: mod.subject!, title: mod.title!, vm: vm, showDeleted: $showDeleted)
                                Spacer()
                            }
                        }.padding(.horizontal)
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
                            ForEach(vm.savedIdea) { mod in
                                SmallCardIdeas(subject: mod.subject!, title: mod.title!, vm: vm, showDeleted: $showDeleted)
                                Spacer()
                            }
                        }.padding(.horizontal)
                    }
                    
                    HStack {
                        Text("Projects")
                            .font(.title3)
                            .fontWeight(.bold)
                        Spacer()
                        Button {
                            showAddProject.toggle()
                        } label: {
                            ButtonView()
                        }
                    }.padding(5)
                        .padding(.horizontal)
                    
                    ForEach(vmProject.savedProjects) { mod in
                        NavigationLink(destination: ProjectView(title: mod.title ?? "No Title provided", imgNum: mod.imgCount, descriptionTxt: mod.projectDescrip ?? "No description provided",  hexColor: mod.cardColor ?? "#000000", git: mod.githubLink ?? "No Link provided", videoLink: mod.video ?? "NA", vm: vmProject)) {
                            ProjectCard(title: mod.title ?? "Title", description: mod.projectDescrip ?? "Description", hexColor: mod.cardColor ?? "#000000", vm: vmProject)
                            
                        }
                    }
                    
                    Spacer()
                }
            }.navigationBarTitle("")
                .navigationBarHidden(true)
                .present(isPresented: $showIdea, type: .alert, animation: Animation.interactiveSpring(), autohideDuration: nil, closeOnTap: false) {
                    AddIdeasView(vm: vm, showIdea: $showIdea, showAdded: $showAdded)
                }
                .present(isPresented: $showTodo, type: .alert, animation: Animation.interactiveSpring(), autohideDuration: nil, closeOnTap: false) {
                    AddTodoView(vm: vm, showTodo: $showTodo, showAdded: $showAdded)
                }
                .present(isPresented: $showDeleted, type: .floater(verticalPadding: 60.0), position: .top, animation: Animation.easeInOut, autohideDuration: 5.0, closeOnTap: false) {
                    DeletedCard()
                }
                .present(isPresented: $showAdded, type: .floater(verticalPadding: 60.0), position: .top, animation: Animation.easeInOut, autohideDuration: 5.0, closeOnTap: false) {
                    AddedCard(text: "Your Item has been added")
                }
                .present(isPresented: $isProjectAdded, type: .floater(verticalPadding: 60.0), position: .top, animation: Animation.easeInOut, autohideDuration: 5.0, closeOnTap: false) {
                    AddedCard(text: "Your project has been added")
                }
                .sheet(isPresented: $showAddProject) {
                 
                    AddProjectView(vm: vmProject, showAddProject: $showAddProject, isProjectAdded: $isProjectAdded)
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
