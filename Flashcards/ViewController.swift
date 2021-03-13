//
//  ViewController.swift
//  Flashcards
//
//  Created by Tigist Mebrate on 2/20/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var answerlabel: UILabel!
    @IBOutlet weak var questionlabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewoControllerViewController
        
        creationController.flashcardsController = self
    }
    
    @IBAction func didTapOnFlashcard(_ sender: Any) {
        questionlabel.isHidden=true
    }
    
    func updateFlashcard(question: String, answer: String){
        questionlabel.text = question
        answerlabel.text = answer
    }
}

