//
//  AnasayfaViewModel.swift
//  toDoAppHomeWork
//
//  Created by Emre Özbağdatlı on 3.10.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel{
    
    
    var tRepo = TasksDaoRepo()
    
    var taskList = BehaviorSubject<[Tasks]>(value: [Tasks]())
    
    init(){
        tRepo.databaseCopy()
        taskList = tRepo.taskList
    }
    
    func search(searchText:String){
        tRepo.search(searchText: searchText)
    }
    func delete(task_id: Int){
        tRepo.delete(task_id: task_id)
        upload()
    }
    func upload(){
        tRepo.upload()
    }
}
