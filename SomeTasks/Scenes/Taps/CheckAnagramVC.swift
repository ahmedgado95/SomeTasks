//
//  CheckAnagramVC.swift
//  SomeTasks
//
//  Created by ahmed gado on 20/12/2020.
//  Copyright © 2020 ahmedgado. All rights reserved.
//

import UIKit

class CheckAnagramVC: UIViewController {
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var showResultLabel: UILabel!
    var isAnagram = true
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showResultButtonPressed(_ sender: Any) {
        print(anagramChecker(a: firstTextField.text!, b: secondTextField.text!))
        
        
    }
    
    func anagramChecker(a:String,b:String) -> (Bool) {
        let aCharacters = Array(a)
        let bCharacters = Array(b)
        var count = 0
        var replacementRequiredWords:[Character] = [Character]()
        showResultLabel.text = "True"
        
        if aCharacters.count == bCharacters.count {
            let listA = aCharacters.filter { !bCharacters.contains($0) }
            for i in 0 ..< listA.count {
                if !replacementRequiredWords.contains(listA[i]) {
                    count = count + 1
                    replacementRequiredWords.append(listA[i])
                    isAnagram = false
                    showResultLabel.text = "False"
                }
            }
            let listB = bCharacters.filter { !aCharacters.contains($0) }
            for i in 0 ..< listB.count {
                if !replacementRequiredWords.contains(listB[i]) {
                    count = count + 1
                    replacementRequiredWords.append(listB[i])
                    isAnagram = false
                    showResultLabel.text = "False"
                    
                }
            }
        }else{
            //cant be an anagram
            count = -1
        }
        return (isAnagram)
    }
    
}
