//
//  ThankYouController.swift
//  CoreDataTest
//
//  Created by vikas on 26/06/17.
//  Copyright © 2017 vikas. All rights reserved.
//

import UIKit

class ThankYouController: UIViewController {

    @IBOutlet weak var txtLbl: UILabel!
    
    var fname:String!
    var lname:String!
    var email:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtLbl.text = fname+" "+lname
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let objNextViewController = storyBoard.instantiateViewController(withIdentifier: "VideoController") as! VideoController
        
        objNextViewController.fname = fname
        objNextViewController.lname = lname
        objNextViewController.email = email
        
        self.present(objNextViewController, animated:false, completion:nil)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
