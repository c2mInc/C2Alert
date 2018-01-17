//
//  ViewController.swift
//  C2Alert
//
//  Created by Berk-Kaya on 01/16/2018.
//  Copyright (c) 2018 Berk-Kaya. All rights reserved.
//

import UIKit
import C2Alert

class ViewController: UIViewController {

    var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "background")
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView.frame = view.frame
        view.addSubview(imageView)
        view.sendSubview(toBack: imageView)
    }
    
    @IBAction func btnMessageClick(_ sender: Any) {
        let alert = C2Alert(message: "Hello!")
        alert.dialogBackgroundColor = .black
        alert.dialogMessageTextColor = .white
        alert.overlay = false
        alert.show()
    }
    @IBAction func btnAlertIconClick(_ sender: Any) {
        let image = #imageLiteral(resourceName: "success_icon")
        let alert = C2Alert(title: "Success", message: "You're doing great!", image: image)
        alert.show()
        
    }
    @IBAction func btnAlertIcon2Click(_ sender: Any) {
        let image = #imageLiteral(resourceName: "error_icon")
        let alert = C2Alert(title: "Error", message: "This is an error!", image: image)
        alert.dialogImageColor = .red
        alert.show()
    }
    @IBAction func btnAlertNoIcon(_ sender: Any) {
        
        let alert = C2Alert(title: "Hello!", message: "This is a message")
        alert.autoHideAfterSeconds = 3
        alert.dialogMessageTextColor = .darkText
        alert.show()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

