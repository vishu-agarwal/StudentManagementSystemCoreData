//
//  CoreDataHandler.swift
//  StudentManagementSystemCoreData
//
//  Created by DCS on 08/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation
import UIKit
import CoreData

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
    func insert(id:String ,name:String,pwd:String, phone: String, std: String , age:Int, completion: @escaping() -> Void)
    {
        let stud  = Student(context: managedObjectContext!)
        stud.spid = id
        stud.studName = name
        stud.standard = std
        stud.age = Int16(age)
        stud.password = pwd
        stud.phoneno = phone
        save()
        
        completion()
        
    }
    func update (stud: Student,id:String ,name:String,pwd:String, phone: String, std: String , age:Int, completion: @escaping() -> Void) {
        stud.spid = id
        stud.studName = name
        stud.standard = std
        stud.age = Int16(age)
        stud.password = pwd
        stud.phoneno = phone
        save()
        
        completion()
        
    }
    
    func updatepwd(stud: Student,pwd:String,complition : @escaping () ->Void)
    {
        stud.password = pwd
        save()
        complition()
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
            
            let studArray = [Student]()
            return studArray
        }
    }
    
    //NOtice..............................................................
    
    func ninsert(title:String,msg:String, completion: @escaping() -> Void)
    {
        let notice  = Note(context: managedObjectContext!)
        notice.msg = msg
        notice.title = title
        save()
        
        completion()
        
    }
    func nupdate (note : Note,title:String,msg:String, completion: @escaping() -> Void) {
      
        //let notice  = Note(context: managedObjectContext!)
        note.msg = msg
        note.title = title
        save()
        
        completion()
        
    }
    
   
    
    func ndelete(notice:Note, completion: @escaping() -> Void)
    {
        managedObjectContext!.delete(notice)
        save()
        completion()
    }
    
    func nfetch() -> [Note]
    {
        let fetchRequest : NSFetchRequest<Note> = Note.fetchRequest()
        do{
            let noteArray = try managedObjectContext?.fetch(fetchRequest)
            return noteArray!
        }
        catch{
            print(error)
            
            let noteArray = [Note]()
            return noteArray
        }
    }
}
