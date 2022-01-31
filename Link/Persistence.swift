//
//  Persistence.swift
//  Link
//
//  Created by Johan Solbakken on 30/01/2022.
//

import CoreData

class PersistenceController: ObservableObject {
    let container: NSPersistentContainer;
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Link");
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null");
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true;
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)");
            }
        });
    }
}
