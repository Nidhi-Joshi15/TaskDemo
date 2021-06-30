//
//  DataManager.swift
//  AppDemo
//
//  Created by Nidhi Joshi on 30/06/2021.
//

import Foundation
import CoreData
import UIKit


class DataManager {
    var data: [NSManagedObject] = []
    
    func save(_ dictData:[DataModel]) {
            //As we know that container is set up in the AppDelegates so we need to refer that container.
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            
            //We need to create a context from this container
            let managedContext = appDelegate.persistentContainer.viewContext
            
            //Now let’s create an entity and new user records.
            let dataEntity = NSEntityDescription.entity(forEntityName: "DataEntity", in: managedContext)!
            
            //final, we need to add some data to our newly created record for each keys using
            //here adding 5 data with loop
            
            for item in dictData {
                let newObj = NSManagedObject(entity: dataEntity, insertInto: managedContext)
                newObj.setValue(item.title, forKeyPath: "title")
                newObj.setValue(item.userId, forKey: "userId")
                newObj.setValue(item.body, forKey: "body")
                newObj.setValue(item.id, forKey: "id")
            }

            //Now we have set all the values. The next step is to save them inside the Core Data
            do {
                try managedContext.save()
               
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
    }
    
    func updateData(_ data: [DataModel]){
    
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "DataEntity")
        for item in data {
            fetchRequest.predicate = NSPredicate(format: "id = %d", item.id)
            do
            {
                let test = try managedContext.fetch(fetchRequest)
                
                    let objectUpdate = test[0] as! NSManagedObject
                    objectUpdate.setValue(item.title, forKeyPath: "title")
                    objectUpdate.setValue(item.userId, forKey: "userId")
                    objectUpdate.setValue(item.body, forKey: "body")
                    
                }
            catch
            {
                print(error)
            }
       
        }
        do{
            try managedContext.save()
        }
        catch
        {
            print(error)
        }
        
    }
    
    func retrieveData() -> Bool {
        
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return false }
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //Prepare the request of type NSFetchRequest  for the entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DataEntity")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            return !(result as! [NSManagedObject]).isEmpty
        } catch {
            
            print("Failed")
        }
        
        return false
    }
}
