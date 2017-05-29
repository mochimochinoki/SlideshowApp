//
//  EnlargeViewController.swift
//  SlideshowApp
//
//  Created by yamamoto yasuhiro on 2017/05/25.
//  Copyright © 2017年 mochimochinoki. All rights reserved.
//

import UIKit

class EnlargeViewController: UIViewController {
    var imagea = UIImage()

    @IBOutlet weak var enlargeView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        enlargeView.image = imagea

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
