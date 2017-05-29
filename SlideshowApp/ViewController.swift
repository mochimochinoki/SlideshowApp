//
//  ViewController.swift
//  SlideshowApp
//
//  Created by yamamoto yasuhiro on 2017/05/20.
//  Copyright © 2017年 mochimochinoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var goButton: UIBarButtonItem!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var startstop: UIBarButtonItem!
    let image1 = UIImage(named: "forest.jpg")!
    let image2 = UIImage(named: "mountain.jpg")!
    let image3 = UIImage(named: "lightbulb.jpg")!
    var timer: Timer!
    func setButtonEnabled(startstop:Bool){
        self.goButton.isEnabled = startstop
        self.backButton.isEnabled = startstop
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = image1
        image.isUserInteractionEnabled = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updatephoto(){
        if image.image == image1{
            image.image = image2
        }else if image.image == image2{
            image.image = image3
        }else{
            image.image = image1
        }
        
    }
    
    
    @IBAction func nextPhoto(_ sender: Any) {
        if image.image == image1{
            image.image = image2
        }else if image.image == image2{
            image.image = image3
        }else{
            image.image = image1
        }
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        if image.image == image1{
            image.image = image3
        }else if image.image == image2{
            image.image = image1
        }else{
            image.image = image2
        }
        
    }
    @IBAction func startstopButton(_ sender: Any) {
        if self.timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updatephoto), userInfo: nil, repeats: true)
            setButtonEnabled(startstop: false)
        }else{
            self.timer.invalidate()
            setButtonEnabled(startstop: true)
            self.timer = nil
        }
        
    }
    @IBAction func tapimage(_ sender: Any) {
        performSegue(withIdentifier: "toEnlargeViewController" , sender: nil)
        if self.timer != nil{
            self.timer.invalidate()
            self.timer = nil
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if segue.identifier == "toEnlargeViewController"{
            let subVC = segue.destination as! EnlargeViewController
            if image.image == image1{
                subVC.imagea = self.image1
            }else if image.image == image2{
                subVC.imagea = self.image2
            }else if image.image == image3{
                subVC.imagea = self.image3
            }
        }
    }
    @IBAction func returnToTop(segue: UIStoryboardSegue){
        if self.timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updatephoto), userInfo: nil, repeats: true)
        }
    }
}
