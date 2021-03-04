//
//  DataBaseHelper.swift
//  drinkNotification
//
//  Created by Apple on 17/02/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import CoreData

class DataBaseHelper: NSObject {

    static var sharedInstance = DataBaseHelper()
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var vc: favouriteViewController?
    func saveData(dataDict: [String: Any]){
        let data = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context) as! Person
        
        data.email = dataDict["email"] as? String
        data.password = dataDict["password"] as? String
        data.age = dataDict["age"] as? Int16 ?? 0
        
        do{
            try context.save()
        }catch let err{
            print("data is showing error :- \(err.localizedDescription)")
        }
    }
    
    func getUserData() -> [Person] {
        var arrData = [Person]()
        let fetchingRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        do{
            arrData = try context.fetch(fetchingRequest) as! [Person]
        }catch let err{
            print("eror in fetching data:-\(err.localizedDescription)")
        }
        return arrData
    }
    
    func editUserData(dict: [String: String], index: Int){
        let User = getUserData()
        
        User[index].email = dict["email"]
        User[index].password = dict["password"]
        if let age = Int16(dict["age"] ?? "0"){
            User[index].age = age
        }
        
        do{
            try context.save()
        }catch let err{
            print("saving error :- \(err.localizedDescription)")
        }
    }
    
    func saveToFavourite(saveDict: [String: Any]){
        let data = NSEntityDescription.insertNewObject(forEntityName: "FavouriteJuices", into: context) as! FavouriteJuices
        data.juiceName = saveDict["name"] as? String
        data.juiceDescription = saveDict["description"] as? String
        data.juiceImage = saveDict["image"] as? Data
        
        do{
            try context.save()
        }catch let err{
            print("saving error :- \(err.localizedDescription)")
        }
    }
    func getFavouriteData() -> [FavouriteJuices] {
        var arrData = [FavouriteJuices]()
        let fetchingRequest = NSFetchRequest<NSManagedObject>(entityName: "FavouriteJuices")
        do{
            arrData = try context.fetch(fetchingRequest) as! [FavouriteJuices]
        }catch let err{
            print("error in fetching juice :- \(err.localizedDescription)")
        }
        return arrData
    }
    
    func deleteFavouriteJuice(index: Int) -> [FavouriteJuices] {
        let juiceData = self.getFavouriteData()
        context.delete(juiceData[index])
       
        do{
            try context.save()
        }catch let err{
            print("deleting error:- \(err.localizedDescription)")
        }
        return juiceData
    }
    
    func saveCollegeDetail(saveDict: [String: Any]) {
        let data = NSEntityDescription.insertNewObject(forEntityName: "CollegeName", into: context) as! CollegeName
        data.address = saveDict["address"] as? String
        data.city = saveDict["city"] as? String
        data.name = saveDict["name"] as? String
        data.university = saveDict["university"] as? String
        
        do{
            try context.save()
        }catch let err{
            print("college saving error :- \(err.localizedDescription)")
        }
    }
}
