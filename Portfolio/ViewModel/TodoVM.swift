//
//  ToDoVM.swift
//  Portfolio
//
//  Created by Segun Awe on 1/4/22.
//

import Foundation
import CoreData
class TodoVM: ObservableObject {
    
let container: NSPersistentContainer
    @Published var savedData: [TodoEntityTwo] = []
    @Published var savedIdea: [IdeaEntityTwo] = []
    
    init() {
        container = NSPersistentContainer(name: "ProjectCoreData")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("error loading data \(error)")
            }
        }
        fetchTodoData()
        fetchIdeaData()
    }
    
    func fetchTodoData() {
        let request = NSFetchRequest<TodoEntityTwo>(entityName: "TodoEntityTwo")
        do {
            savedData = try container.viewContext.fetch(request)
        } catch let error {
            print("error fetching data \(error)")
        }
    }
    // fetching Idea Data
    func fetchIdeaData() {
        let request = NSFetchRequest<IdeaEntityTwo>(entityName: "IdeaEntityTwo")
        do {
            savedIdea = try container.viewContext.fetch(request)
        } catch let error {
            print("error fetching data \(error)")
        }
    }
    
    func addTodo(titleTxt: String, subjectTxt: String) {
        let entity = TodoEntityTwo(context: container.viewContext)
        entity.subject = subjectTxt
        entity.title = titleTxt
        saveData()
    }
    
    func addIdea(titleTxt: String, subjectTxt: String) {
        let entity = IdeaEntityTwo(context: container.viewContext)
        entity.subject = subjectTxt
        entity.title = titleTxt
        saveData()
    }
    
    func saveData() {
          do {
              try container.viewContext.save()
              fetchTodoData()
              fetchIdeaData()
          } catch let error {
              print("error saving \(error)")
          }
      }
    
    func deleteTodo(titleTxt: String) {
        for i in savedData {
            if i.title == titleTxt {
                container.viewContext.delete(i)
                saveData()
            }
        }
    }
    func deleteIdea(titleTxt: String) {
        for i in savedIdea {
            if i.title == titleTxt {
                container.viewContext.delete(i)
                saveData()
            }
        }
    }
    
    

    
}
