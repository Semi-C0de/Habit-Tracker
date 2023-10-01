//
//  DataController.swift
//  Habit Tracker
//
//  Created by Lalith Shravan Guruprasad on 9/30/23.
//

import Foundation

import Foundation
import CoreData

class DataController<s:NSManagedObject> : ObservableObject {
    
    @Published var savedEntities: [s] = []
    let container:NSPersistentContainer
    let entityName:String
    
    init(entityName:String, containerName:String) {
        self.entityName = entityName
        self.container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores {description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
        fetchData()
    }
    
    func fetchData(){
        let request = NSFetchRequest<s>(entityName: self.entityName)
        
        do {
            self.savedEntities = try container.viewContext.fetch(request)
        } catch {
            print("Error fetching data.")
        }
    }
    
    func add(_ parameters:(s)-> ()){
        let object = s(context: container.viewContext)
        parameters(object)
        saveData()
    }
    
    func update(obj:s, _ parameters:(s)-> ()){
        parameters(obj)
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchData()
        } catch let error {
            print ("Error saving. \(error)")
        }
    }
    
    func delete(At indexSet:IndexSet) {
        guard let index = indexSet.first else {return}
        let entity = self.savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func delete(Object object:s) {
        container.viewContext.delete(object)
        saveData()
    }
}
