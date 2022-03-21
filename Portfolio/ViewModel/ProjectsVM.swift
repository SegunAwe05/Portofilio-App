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
    @Published var savedProjects: [ProjectEntityTwo] = []
    @Published var imgData: [UIImage] = []
    @Published var isLoading = false
    
    init() {
        container = NSPersistentContainer(name: "ProjectCoreData")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("error loading data \(error)")
            }
        }
        
        fetchData()

    }
    
    func fetchData() {
        let request = NSFetchRequest<ProjectEntityTwo>(entityName: "ProjectEntityTwo")
        do  {
            savedProjects = try container.viewContext.fetch(request)
        } catch let error {
            print("error fetching data \(error)")
        }
    }
    
    func addProject(titleTxt: String, videoTxt: String, projectDescripTxt: String, cardColorTxt: String, github: String, picturesData: [UIImage], imgNumber: Int16) {
        let entity = ProjectEntityTwo(context: container.viewContext)
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        var num = 1
        var imgTxt = "\(titleTxt)\(num).png"

        
        entity.title = titleTxt
        entity.video = videoTxt
        entity.projectDescrip = projectDescripTxt
        entity.cardColor = cardColorTxt
        entity.githubLink = github
        entity.imgCount = imgNumber
        
        for i in picturesData {
                      
            // Create URL
            let url = documents.appendingPathComponent(imgTxt)
            if let data = i.pngData() {
                do {
                    try data.write(to: url)
                    print(url)
                } catch {
                    print("Unable to Write Image Data to Disk")
                }
            }
            num = num + 1
            imgTxt = "\(titleTxt)\(num).png"
            print(num)
        }
        
        saveData()
    }
    
    func deleteProject(titleTxt: String) {
        for i in savedProjects {
            if i.title == titleTxt {
                container.viewContext.delete(i)
                saveData()
            }
        }

    }
    
    func deleteNil() {
        for i in savedProjects {
            if i.title == nil || i.title == "title"{
                container.viewContext.delete(i)
                saveData()
            }
        }
    }
    
  
    
    func saveData() {
          do {
              try container.viewContext.save()
             fetchData()
          } catch let error {
              print("error saving \(error)")
          }
      }
    
    func retImage(title: String, num: Int16) {
       // isLoading = true
        var fileTxt = ""
        for i in 1...num {
            fileTxt = "\(title)\(i).png"
            if let imagePath = getFilePath(fileName: fileTxt) {
                imgData.append(UIImage(contentsOfFile: imagePath)!)
                }
        }
      //  isLoading = false
    }
    func getFilePath(fileName: String) -> String? {
        
        let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let nsUserDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        var filePath: String?
        let paths = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
        if paths.count > 0 {
            let dirPath = paths[0] as NSString
            filePath = dirPath.appendingPathComponent(fileName)
        }
        else {
            filePath = nil
        }
        return filePath
    }
    
    func getDocumentsDirectory() {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        print(documentsDirectory)
    }
    
}

