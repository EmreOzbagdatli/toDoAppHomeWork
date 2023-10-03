//
//  KayitVC.swift
//  toDoAppHomeWork
//
//  Created by Emre Özbağdatlı on 3.10.2023.
//

import UIKit

class KayitVC: UIViewController {

    @IBOutlet weak var kayitTextField: UITextField!
    
    var viewModel = KayitViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .orange

        // Do any additional setup after loading the view.
    }
    
    @IBAction func kayitButton(_ sender: Any) {
        if let taskText = kayitTextField.text{
            viewModel.added(text: taskText)
        }
    }
    

}
