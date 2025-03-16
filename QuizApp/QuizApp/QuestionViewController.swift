//
//  QuestionViewController.swift
//  QuizApp
//
//  Created by Pavel Palancica  on 13.03.2025.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    
    private var question: String = ""
    
    convenience init(question: String) {
        self.init()
        self.question = question
    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerLabel.text = question
    }
}
