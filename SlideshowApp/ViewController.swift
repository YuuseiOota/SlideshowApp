//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Ota Yusei on 2018/06/21.
//  Copyright © 2018年 yuusei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    @IBAction func tapImage(_ sender: Any) {
        performSegue(withIdentifier: "zoom", sender: nil)
    }
    
    var timer: Timer!
    var imageIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let zoomViewController:ZoomViewController = segue.destination as! ZoomViewController
        zoomViewController.imageIndex = imageIndex - 1
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        if self.timer == nil {
            imageIndex -= 2
            displayImage()
        }
    }
    
    @IBAction func tapShowButton(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(displayImage), userInfo: nil, repeats: true)
            button.setTitle("停止", for: .normal)
        } else {
            self.timer.invalidate()
            self.timer = nil
            button.setTitle("再生 ", for: .normal)
        }
    }
    
    @IBAction func tapNextButton(_ sender: Any) {
        if self.timer == nil {
            displayImage()
        }
    }
    
    @objc func displayImage() {
        //画像の配列
        let imageArray = ["work1.jpg", "work2.jpg",  "work3.jpg", "work4.jpg", "work5.jpg", "work6.jpg", "work7.jpg", "work8.jpg", "work9.jpg", "work10.jpg", "work11.jpg"]
        
        //Indexが0を下回る時は、最後の画像を表示
        if imageIndex < 0 {
            imageIndex = 10
        }
        //Indexが10を上回る時は、最初の画像を表示
        if imageIndex > 10 {
            imageIndex = 0
        }
        
        //配列からIndexにしたがってimageを設定
        let image = UIImage(named: imageArray[imageIndex])
        imageView.image = image
        imageIndex += 1
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    


}

