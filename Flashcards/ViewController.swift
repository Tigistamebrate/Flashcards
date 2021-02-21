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


    @IBAction func didTapOnFlashcard(_ sender: Any) {
        questionlabel.isHidden=true
    }
}

