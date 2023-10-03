//
//  TasksDaoRepo.swift
//  toDoAppHomeWork
//
//  Created by Emre Özbağdatlı on 3.10.2023.
//

import Foundation
import RxSwift

class TasksDaoRepo{
    
    var taskList = BehaviorSubject<[Tasks]>(value: [Tasks]())
    
    let db: FMDatabase?
    
    init(){
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dbURL = URL(fileURLWithPath: targetPath).appendingPathComponent("tasks.db")
        db = FMDatabase(path: dbURL.path)
    }
    func added(text: String){
        db?.open()
        do{
            try db!.executeUpdate("INSERT INTO tasks (task_text) VALUES (?) ", values: [text])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func update(task_text: String, task_id:Int){
        db?.open()
        do{
            try db!.executeUpdate("UPDATE tasks SET task_text=? WHERE task_id=?", values: [task_text, task_id])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func search(searchText: String){
        db?.open()
        var tasks = [Tasks]()
        do{
            let rs = try db!.executeQuery("SELECT * FROM tasks WHERE task_text like '%\(searchText)%' ", values: nil)
            while rs.next(){
                let task_id = Int(rs.string(forColumn: "task_id"))!
                let task_text = rs.string(forColumn: "task_text")!
                let task = Tasks(task_id: task_id, task_text: task_text)
                tasks.append(task)
                
            }
            taskList.onNext(tasks)
        }catch{
            
        }
        db?.close()
    }
    
    func delete(task_id: Int){
        db?.open()
        do{
            try db?.executeUpdate("DELETE FROM tasks WHERE task_id=? ", values: [task_id])
        }catch{
            
        }
        db?.close()
    }
    
    func upload(){
        db?.open()
        var tasks = [Tasks]()
        do{
            let rs = try db!.executeQuery("SELECT * FROM tasks", values: nil)
            while rs.next(){
                let task_id = Int(rs.string(forColumn: "task_id"))!
                let task_text = rs.string(forColumn: "task_text")!
                let task = Tasks(task_id: task_id, task_text: task_text)
                tasks.append(task)
                
            }
            taskList.onNext(tasks)
        }catch{
            
        }
        db?.close()
        
        
    }
    
    func databaseCopy(){
        let bundlePath = Bundle.main.path(forResource: "tasks", ofType: ".db")
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let locationToCopy = URL(fileURLWithPath: targetPath).appendingPathComponent("tasks.db")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: locationToCopy.path){
            print("database already exists")
        }else{
            do{
                try fileManager.copyItem(atPath: bundlePath!, toPath: locationToCopy.path)
            }catch{}
        }
    }
}
