//
//  ViewController.swift
//  userConnection
//
//  Created by Adam Mabrouki on 24/02/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let connectionService = ConnectionService()
    

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passworldTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
//    override func prepareFor(for segue: UIStoryboardSegue, sender: Any?) {
//        let cameraVC = segue.destination
//
//    }


    @IBAction func validateButtonTaped(_ sender: Any) {
        let userName = userNameTextField.text ?? ""
        let password = passworldTextField.text ?? ""
        
        connectionService.getCamera(username: userName, password: password) { result in
            switch result {
            case .success(let response):
                if response {
                    print("authentified")
                self.performSegue(withIdentifier: "result", sender: nil)
               // print(response.get())
                } else {
                    print("invalid Password")
                }
            case .failure(let error):
                print(error)
            }
        }
        
        
        
    }
    
}

