//
//  FavouriteItems.swift
//  Sports App
//
//  Created by EsraaAbdelfatah on 5/6/23.
//

import Foundation
import UIKit
import CoreData

class FavouriteItems{
    var context : NSManagedObjectContext?
    var entity : NSEntityDescription?
    static var favouriteItems = FavouriteItems()
    
    private init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        entity = NSEntityDescription.entity(forEntityName: "FavoriteTeam", in: context!)
    }
    
    
    func InsertItem(favouriteName : String , favouriteId : Int , sportType : String){
        let newTeam = NSManagedObject(entity: entity!, insertInto: context)
        newTeam.setValue(favouriteName, forKey: "favoriteName")
        newTeam.setValue(favouriteId, forKey: "favoriteId")
        newTeam.setValue(sportType, forKey: "sportType")
        do {
            try context?.save()
            print("\(favouriteName) Inserted")
            print("\(sportType) Inserted")
         } catch {
          print("Error saving")
        }
    }
    func deleteItem(favouriteItem : NSManagedObject){
                do {
                    context?.delete(favouriteItem)
                    try context?.save()
                  } catch {
                    
                    print("Failed")
                }
    }
    
    func fetchFavouriteItems() -> [NSManagedObject]{
        var favouritesList : [NSManagedObject]?
        favouritesList = []
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteTeam")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context?.fetch(request)
            for data in result as! [NSManagedObject]{
                favouritesList?.append(data)
                print(data.value(forKey: "favoriteName") as! String)
            }
        } catch {
            print("Failed")
        }
        return favouritesList!
    }
    
}
