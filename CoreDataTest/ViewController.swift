//
//  ViewController.swift
//  CoreDataTest
//
//  Created by vikas on 04/04/17.
//  Copyright © 2017 vikas. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var fnameTxt: UITextField!
    @IBOutlet weak var lnameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    
    var databasePath = String()
    
    let reachability = Reachability()!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //fnameTxt.font = [UIFont fontWithName,:@"HelveticaCY-Plain" size:22];
    }
    
    // UITextField Delegates
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print("TextField did begin editing method called")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
//        print("TextField did end editing method called")
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        print("TextField should begin editing method called")
        return true;
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
//        print("TextField should clear method called")
        return true;
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        print("TextField should snd editing method called")
        return true;
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //        print("While entering the characters this method gets called")
        
//        guard let text = textField.text else { return true }
         return true;
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        print("TextField should return method called")
        textField.resignFirstResponder();
        return true;
    }
    
    @IBAction func SubmitAction(_ sender: Any) {
        if (isEmpty(sender: fnameTxt)) {
            alert(message: "First Name can\'t be empty")
        }else if(isEmpty(sender: lnameTxt)){
            alert(message: "Last Name can\'t be empty")
        }/*else if(isEmpty(sender: emailTxt)){
            alert(message: "Email Id can\'t be empty")
        }else if (!isValidEmail(emilStr: emailTxt.text!)) {
            alert(message: "Enter a valid email id")
        }*/else{
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let objNextViewController = storyBoard.instantiateViewController(withIdentifier: "WelcomeController") as! WelcomeController
            
            objNextViewController.fname = fnameTxt.text!
            objNextViewController.lname = lnameTxt.text!
            objNextViewController.email = emailTxt.text!
            
            self.present(objNextViewController, animated:true, completion:nil)
        }

    }
    
    func alert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func isEmpty(sender: UITextField) -> Bool {
        
        if (sender.text?.isEmpty)! {
            // textfield is empty
            return true
        } else {
            // text field is not empty
            return false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print("memory warning")
    }
    
    //---------------------------------------------- validations --------------------------------------------------------//
    
    func isValidEmail(emilStr:String) -> Bool {
        print("validate emilId: \(emilStr)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: emilStr)
        return result
    }
    func isValidMobileNumber(mobile:String) -> Bool {
        print("validate emilId: \(mobile)")
        let emailRegEx = "^([+][9][1]|[9][1]|[0]){0,1}([7-9]{1})([0-9]{9})$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: mobile)
        return result
    }



}

