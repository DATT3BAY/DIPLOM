//
//  ViewController.swift
//  AroundTheWorld
//
//  Created by Александр Анисимов on 04/03/2022.
//  Copyright © 2022 Александр Анисимов. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    @IBOutlet weak var gifImage: UIImageView!
    @IBOutlet weak var videoLayer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        gifImage.loadGif(name: "gifka_zemli2")
        playVideo()
    }

    func playVideo() {
        guard let path = Bundle.main.path(forResource: "intro", ofType: "mp4")
            else {
                return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        self.videoLayer.layer.addSublayer(playerLayer)
        player.play()
        
        videoLayer.bringSubviewToFront(gifImage)
    }

}

