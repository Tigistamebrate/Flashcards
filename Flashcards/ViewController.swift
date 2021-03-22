//
//  ViewController.swift
//  Flashcards
//
//  Created by Tigist Mebrate on 2/20/21.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
}

class ViewController: UIViewController {

    @IBOutlet weak var answerlabel: UILabel!
    @IBOutlet weak var questionlabel: UILabel!
    
    //Array to hold our flashcards
    var flashcards = [Flashcard]()
    //current flashcard index
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        readSavedFlashcards()
        if flashcards.count == 0 {
            updateFlashcard(question: "What is the capital of Brazil?", answer: "Brasilia")
        } else {
            updateLabels()
            updateNextPrevButtons()
        }
            }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewoControllerViewController
        
        creationController.flashcardsController = self
    }
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var prevButton: UIButton!
    
    func updateNextPrevButtons(){
        
        // Disable prev button if at the beginning
        
        if currentIndex == 0 {
            prevButton.isEnabled = false
           // print("If statement works")
        } else {
            prevButton.isEnabled = true
        }
        
        // Disable next button if at the end
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
        
    }
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        currentIndex = currentIndex - 1
        updateLabels()
        updateNextPrevButtons()
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        currentIndex = currentIndex + 1
        updateLabels()
        updateNextPrevButtons()
    }
    
    @IBAction func didTapOnFlashcard(_ sender: Any) {
        questionlabel.isHidden=true
    }
    
    func updateFlashcard(question: String, answer: String){
        let flashcard = Flashcard(question: question, answer: answer)
        // Adding flashcard in the flashcards Array
        flashcards.append(flashcard)
        
        currentIndex = flashcards.count - 1
        print("We now have \(flashcards.count) flashcards")
        print("Our current index is \(currentIndex)")
        
        // update buttons
        updateLabels()
        updateNextPrevButtons()
        
        saveAllFlashcardToDisk()
        
    }
    
    func updateLabels(){
        let currentFlashcard = flashcards[currentIndex]
        
        questionlabel.text = currentFlashcard.question
        answerlabel.text = currentFlashcard.answer
    }
    
    func saveAllFlashcardToDisk(){
        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return ["question": card.question, "answer": card.answer]
        }
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
    }
    
    func readSavedFlashcards(){
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]]{
            let savedCards = dictionaryArray.map { dictionary -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
            }
            flashcards.append(contentsOf: savedCards)
        }
    }
}

