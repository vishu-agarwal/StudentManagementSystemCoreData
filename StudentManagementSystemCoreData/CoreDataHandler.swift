//
//  CoreDataHandler.swift
//  StudentManagementSystemCoreData
//
//  Created by DCS on 08/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation
import UIKit


class CoreDataHandler {
    
    static let shared = CoreDataHandler()
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    let managedObjectContext : NSManagedObjectContext?
    
    private init(){
        //persistent()
        managedObjectContext = appdelegate.persistentContainer.viewContext
    }
    
    func save(){
        appdelegate.saveContext()
    }
    func insert(id:String ,name:String,city:String, phone: String, std: String , age:Int, completion: @escaping() -> Void)
    {
        let stud  = Student(context: managedObjectContext)
        stud.spid = id
        stud.studName = name
        stud.standard = std
        stud.age = Int16(age)
        stud.city = city
        stud.phoneno = phone
        save()
        
        completion()
        
    }
    func update (stud: Student,id:String ,name:String,city:String, phone: String, std: String , age:Int, completion: @escaping() -> Void) {
        stud.spid = id
        stud.studName = name
        stud.standard = std
        stud.age = Int16(age)
        stud.city = city
        stud.phoneno = phone
        save()
        
        completion()
        
    }
    
    func delete(stud:Student, completion: @escaping() -> Void)
    {
        managedObjectContext!.delete(stud)
        save()
        completion()
    }
    
    func fetch() -> [Student]
    {
        let fetchRequest : NSFetchRequest<Student> = Student.fetchRequest()
        do{
            let studArray = try managedObjectContext?.fetch(fetchRequest)
            return studArray!
        }
        catch{
            print(error)
            return[Student]()
        }
    }
}
