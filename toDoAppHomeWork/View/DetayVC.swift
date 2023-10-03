//
//  DetayVC.swift
//  toDoAppHomeWork
//
//  Created by Emre Özbağdatlı on 3.10.2023.
//

import UIKit

class DetayVC: UIViewController {

    @IBOutlet weak var detayTextField: UITextField!
    
    var viewModel = DetayViewModel()
    
    var task: Tasks?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .orange

        if let t = task{
            detayTextField.text = t.task_text
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func detayButton(_ sender: Any) {
        if let text  = detayTextField.text, let t = task {
            viewModel.update(task_text: text, text_id: t.task_id)
        }
    }
    
}
