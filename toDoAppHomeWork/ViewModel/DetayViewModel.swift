//
//  DetayViewModel.swift
//  toDoAppHomeWork
//
//  Created by Emre Özbağdatlı on 3.10.2023.
//

import Foundation

class DetayViewModel{
    
    var tRepo = TasksDaoRepo()
    
    func update(task_text: String, text_id:Int){
        tRepo.update(task_text: task_text, task_id: text_id)
    }
}
