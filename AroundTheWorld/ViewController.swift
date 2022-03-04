//
//  ViewController.swift
//  AroundTheWorld
//
//  Created by Александр Анисимов on 04/03/2022.
//  Copyright © 2022 Александр Анисимов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gifImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gifImage.loadGif(name: "gifka_zemli2")
        
        
        // Do any additional setup after loading the view.
    }


}

