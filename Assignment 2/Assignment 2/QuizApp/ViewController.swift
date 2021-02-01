//
//  ViewController.swift
//  QuizApp
//
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startGame(){
        let vc = storyboard?.instantiateViewController(identifier: "quiz") as! QuizViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    

}

