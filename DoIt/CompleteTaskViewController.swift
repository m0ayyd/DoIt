//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by the Luckiest on 6/9/17.
//  Copyright © 2017 the Luckiest. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    var task : Task? = nil
    
    @IBOutlet weak var taskLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        taskLabel.text = task?.name
        if task!.important {
            taskLabel.text = "❗\(task!.name!)"
        } else {
            taskLabel.text = task!.name
        }
    }
    @IBAction func completeTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
}
