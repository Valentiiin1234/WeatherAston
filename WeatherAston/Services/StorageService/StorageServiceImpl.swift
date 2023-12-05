//
//  StorageService.swift
//  WeatherAston
//
//  Created by Mac on 02.12.2023.
//

import CoreData

final class StorageServiceImpl: StorageService {
    
    // MARK: - Core Data stack
    
    private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "WeatherAston")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    // MARK: - CRUD
    func createData(_ nameCity: String) {
        guard let cityDescription = NSEntityDescription.entity(forEntityName: "EntityCity", in: viewContext) else {return}
        let city = EntityCity(entity: cityDescription, insertInto: viewContext)
        city.name = nameCity
        saveContext()
    }
    
    func retriveData(completion: (Result<[EntityCity], Error>) -> Void) {
        let fetchRequest = NSFetchRequest<EntityCity>(entityName: "EntityCity")
        
        do{
            let cities = try viewContext.fetch(fetchRequest)
            completion(.success(cities))
        }catch let error {
            completion(.failure(error))
        }
    }
    
    func updateData() {
        #warning("")
    }
    
    func deleteData(_ entity: EntityCity) {
        viewContext.delete(entity)
        saveContext()
    }

    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
