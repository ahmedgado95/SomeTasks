//
//  Alert.swift
//  SomeTasks
//
//  Created by ahmed gado on 20/12/2020.
//  Copyright © 2020 ahmedgado. All rights reserved.
//

import UIKit

class Alert {
    
    class func showAlertOnVC(target: UIViewController, title: String, message: String) {
        let title = title
        let message = message
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        target.present(alert, animated: true, completion: nil)
    }
    
}
