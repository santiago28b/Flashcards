//
//  ViewController.swift
//  Flashcards
//
//  Created by Santiago Bolaños on 9/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
   
    @IBOutlet weak var optionOne: UIButton!
    @IBOutlet weak var optiontwo: UIButton!
    @IBOutlet weak var optionThree: UIButton!
    
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
        frontLabel.text = question
        backLabel.text = answer
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
    
    
}
