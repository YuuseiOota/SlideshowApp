//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by Ota Yusei on 2018/06/21.
//  Copyright © 2018年 yuusei. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    //受け取るための変数を用意
    var imageIndex: Int = 0
    
    let imageArray = ["work1.jpg", "work2.jpg",  "work3.jpg", "work4.jpg", "work5.jpg", "work6.jpg", "work7.jpg", "work8.jpg", "work9.jpg", "work10.jpg", "work11.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let image = UIImage(named: imageArray[imageIndex])
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController:ViewController = segue.destination as! ViewController
        viewController.imageIndex = imageIndex 
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
