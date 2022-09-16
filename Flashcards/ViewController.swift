//
//  ViewController.swift
//  Flashcards
//
//  Created by Santiago Bolaños on 9/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapOnFlascard(_ sender: Any) {
        frontLabel.isHidden = true
        print("viva venezuela")
    }
    
}

