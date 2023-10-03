//
//  KayitViewModel.swift
//  toDoAppHomeWork
//
//  Created by Emre Özbağdatlı on 3.10.2023.
//

import Foundation

class KayitViewModel{
    
    var tRepo = TasksDaoRepo()
    
    func added(text: String){
        tRepo.added(text: text)
    }
}
