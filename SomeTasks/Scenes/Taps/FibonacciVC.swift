//
//  FibonacciVC.swift
//  SomeTasks
//
//  Created by ahmed gado on 20/12/2020.
//  Copyright © 2020 ahmedgado. All rights reserved.
//

import UIKit

class FibonacciVC: UIViewController {

    @IBOutlet weak var showResult: UILabel!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var SecondTextField: UITextField!
    @IBOutlet weak var showSecondResult: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        hideKeyboardWhenTappedAround()
    }
    

    @IBAction func showSecondResultButtonPressed(_ sender: Any) {
        guard let Num2 : Int = Int(SecondTextField.text!) else {return}
        let result2 = fibonacci(n: Num2)
        showSecondResult.text = "\(result2)"
    }
    
    func fibonacci(n : Int) -> Int{
        if n<0{
            print("Incorrect input")
        }
        else if n==0
        {
            return 0
        }
        else if n==1{
            return 1
        }
        else{
            return fibonacci(n: n-1)+fibonacci(n: n-2)
        }
    return 0000
    }
    @IBAction func showResultFirstButtonPressed(_ sender: Any) {
        guard let Num1 : Int = Int(firstTextField.text!) else {return}
        let result1 = fib(n: Num1)
        showResult.text = "\(result1)"
    }
    
    func fib( n: Int) -> Int {

     var fibs: [Int] = [0, 1]
     switch n
     {
     case 1:  return fibs[0]
     case 2:  return fibs[1]
     default:

     (2...n+1).forEach
     { i in
         fibs.append(fibs[i - 1] + fibs[i - 2])
     }

     return fibs[n]
     }
    }
}
