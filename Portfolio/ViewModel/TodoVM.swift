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
    @Published var savedData: [TodoEntity] = []
    @Published var savedIdea: [IdeaEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "CoreData")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("error loading data \(error)")
            }
        }
        fetchTodoData()
        fetchIdeaData()
    }
    
    func fetchTodoData() {
        let request = NSFetchRequest<TodoEntity>(entityName: "TodoEntity")
        do {
            savedData = try container.viewContext.fetch(request)
        } catch let error {
            print("error fetching data \(error)")
        }
    }
    // fetching Idea Data
    func fetchIdeaData() {
        let request = NSFetchRequest<IdeaEntity>(entityName: "IdeaEntity")
        do {
            savedIdea = try container.viewContext.fetch(request)
        } catch let error {
            print("error fetching data \(error)")
        }
    }
    
    func addTodo(titleTxt: String, subjectTxt: String) {
        let entity = TodoEntity(context: container.viewContext)
        entity.subject = subjectTxt
        entity.title = titleTxt
        saveData()
    }
    
    func addIdea(titleTxt: String, subjectTxt: String) {
        let entity = IdeaEntity(context: container.viewContext)
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
    
    

    
}
