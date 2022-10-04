//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Santiago Bolaños on 10/3/22.
//

import UIKit

class CreationViewController: UIViewController {
    
    var flashCardController: ViewController!

    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var questiontextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        
        let questionText = questiontextField.text
        let answerText = answerTextField.text
        
        flashCardController.updateFlashCard(question: questionText!, answer: answerText!)
        
        dismiss(animated: true)
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
