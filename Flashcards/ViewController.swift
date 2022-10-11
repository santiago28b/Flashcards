//
//  ViewController.swift
//  Flashcards
//
//  Created by Santiago Bolaños on 9/10/22.
//

import UIKit
struct Flashcard{
    var question: String
    var answer:String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    
    @IBOutlet weak var optionOne: UIButton!
    @IBOutlet weak var optiontwo: UIButton!
    @IBOutlet weak var optionThree: UIButton!
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    var flashcards = [Flashcard]()
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //shape
        card.layer.cornerRadius = 20.0
        frontLabel.layer.cornerRadius = 20.0
        frontLabel.clipsToBounds = true
        backLabel.layer.cornerRadius = 20.0
        backLabel.clipsToBounds = true
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        optionOne.layer.borderWidth = 3.0
        optiontwo.layer.borderWidth = 3.0
        optionThree.layer.borderWidth = 3.0
        
        optionOne.layer.cornerRadius = 20.0
        optiontwo.layer.cornerRadius = 20.0
        optionThree.layer.cornerRadius = 20.0
        
        
        //button color
        optionOne.layer.borderColor = UIColor.systemBlue.cgColor
        
        optiontwo.layer.borderColor = UIColor.systemBlue.cgColor
        
        optionThree.layer.borderColor = UIColor.systemBlue.cgColor
        
        updateFlashCard(question: "What is the capital of Venezuela?", answer: "Caracas")
        
        readSavedFlashcards()
        
        if flashcards.count == 0{
            updateFlashCard(question: "What is the capital of Venezuela", answer: "Caracas")
        }else{
            updateLabels()
            updateNextPrevButtons()
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnFlascard(_ sender: Any) {
        if( frontLabel.isHidden == true){
            print("answer")
            frontLabel.isHidden = false
        } else{
            frontLabel.isHidden = true
            print("question")
        }
        
    }
    func updateFlashCard(question:String,answer:String) {
        let flashcard = Flashcard(question: question, answer: answer)
        
        flashcards.append(flashcard)
        print("added a new Flash card, ->")
        print("we now have \(flashcards.count) flashcards")
        currentIndex = flashcards.count - 1
        print("the index is now \(currentIndex)")
        updateNextPrevButtons()
        
        updateLabels()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        
        creationController.flashCardController = self
    }
    
    @IBAction func dipTapOne(_ sender: Any) {
        
    }
    @IBAction func didTapTwo(_ sender: Any) {
        frontLabel.isHidden = true
        
    }
    @IBAction func dipTapThree(_ sender: Any) {
        
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
    
    
    func updateNextPrevButtons(){
        if currentIndex == flashcards.count - 1{
            nextButton.isEnabled = false
        } else{
            nextButton.isEnabled = true
        }
        
        if currentIndex == flashcards.startIndex{
            prevButton.isEnabled = false
        } else {
            prevButton.isEnabled = true
        }
    }
    
    func updateLabels(){
        let currentFlashCard = flashcards[currentIndex]
        
        frontLabel.text = currentFlashCard.question
        backLabel.text = currentFlashCard.answer
        
    }
    
    func saveAllFlashCardsToDisk(){
        
        // UserDefaults.standard.set(flashcards, forKey: "Flashcards")
        let dictionaryArray = flashcards.map { (card)->[String:String] in return ["question":card.question,"answer":card.answer]
            }
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        print("flashcards saved to user default")
    }
    
    func readSavedFlashcards(){
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]]{
            let savedCards = dictionaryArray.map {dictionary -> Flashcard in
                return Flashcard(question:dictionary ["question"]!,answer:dictionary["answer"]!)
            }
            flashcards.append(contentsOf: savedCards)

        }
    }
}
