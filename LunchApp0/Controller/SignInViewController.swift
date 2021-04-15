//
//  SignInViewController.swift
//  LunchApp0
//
//  Created by Manabu Kuramochi on 2021/04/15.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.layer.cornerRadius = 20
        button.layer.cornerRadius = 20
        
        textField.text = Auth.auth().currentUser!.uid
        
    }
    
    
    @IBAction func signIn(_ sender: Any) {
        
        if textField.text == Auth.auth().currentUser!.uid {
            
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        textField.resignFirstResponder()
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
