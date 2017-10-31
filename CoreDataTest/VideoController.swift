//
//  VideoController.swift
//  CoreDataTest
//
//  Created by vikas on 26/06/17.
//  Copyright © 2017 vikas. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import MediaPlayer

class VideoController: UIViewController {
    
    var fname:String!
    var lname:String!
    var email:String!
    
    var player:AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        playVideo()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func playVideoBtn(_ sender: UIButton) {
        playVideo()
    }
    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "sample", ofType:"mp4") else {
            debugPrint("video.mp4 not found")
            return
        }
        player = AVPlayer(url: URL(fileURLWithPath: path))
        
        //------------------------------------ Finish Video  ---------------------------------------------//
        NotificationCenter.default.addObserver(self, selector:#selector(self.playerDidFinishPlaying(note:)),name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        
        let playerController = AVPlayerViewController()
        playerController.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        playerController.player = player
        self.view.addSubview(playerController.view)
        player.play()
        
    }
    
    func playerDidFinishPlaying(note: NSNotification){
        print("Video Finished")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        playVideo()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let objNextViewController = storyBoard.instantiateViewController(withIdentifier: "WelcomeController") as! WelcomeController
        
        objNextViewController.fname = fname
        objNextViewController.lname = lname
        objNextViewController.email = email
        
        player.pause()
        player = nil
        
        self.present(objNextViewController, animated:false, completion:nil)
    }

    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let objNextViewController = storyBoard.instantiateViewController(withIdentifier: "ThankYouController") as! ThankYouController
        
        objNextViewController.fname = fname
        objNextViewController.lname = lname
        objNextViewController.email = email
        
        player.pause()
        player = nil
        self.present(objNextViewController, animated:false, completion:nil)
    }
}
