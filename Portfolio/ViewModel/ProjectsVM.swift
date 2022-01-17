//
//  ProjectsVM.swift
//  Portfolio
//
//  Created by Segun Awe on 1/8/22.
//

import Foundation
import CoreData
import UIKit


class ProjectsVM: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedProjects: [ProjectEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "CoreData")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("error loading data \(error)")
            }
        }
        
        fetchData()
    }
    
    func fetchData() {
        let request = NSFetchRequest<ProjectEntity>(entityName: "ProjectEntity")
        do  {
            savedProjects = try container.viewContext.fetch(request)
        } catch let error {
            print("error fetching data \(error)")
        }
    }
    
    func addProject(titleTxt: String, videoTxt: String, projectDescripTxt: String, cardColorTxt: String, github: String, picturesData: [UIImage]) {
        let entity = ProjectEntity(context: container.viewContext)
        entity.title = titleTxt
        entity.video = videoTxt
        entity.projectDescrip = projectDescripTxt
        entity.cardColor = cardColorTxt
        print("color is done")
        entity.githubLink = github
        
        picturesData.forEach({ im in
            entity.pictures?.append(im.jpegData(compressionQuality: 1)!)
        })
      
        saveData()
        
    }
    
    func saveData() {
          do {
              try container.viewContext.save()
             fetchData()
          } catch let error {
              print("error saving \(error)")
          }
      }
    
}
