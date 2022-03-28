//
//  ViewController.swift
//  AroundTheWorld
//
//  Created by Александр Анисимов on 04/03/2022.
//  Copyright © 2022 Александр Анисимов. All rights reserved.
//
import AVKit
import UIKit
import AVFoundation
import SwiftUI





class ViewController: UIViewController {
    
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var btn: UIView!
    @IBOutlet weak var videoLayer: UIView!
    @IBOutlet weak var lble: UILabel!
    
    //private var aVPlayer: AVPlayer?
    private var playerLayer: AVPlayerLayer?
    var playerLooper: AVPlayerLooper!
    // should be defined in class
    var queuePlayer: AVQueuePlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPlayer()
        playVideo()
        btn.layer.cornerRadius = btn.bounds.height / 2
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("sill diszappear")
        
        queuePlayer?.rate = 0
    }
    
    //MARK: - Работа с анимацией кнопки и реализация перехода на новую сцену
    
    func showAnimation() {
        let pulse = pulseAnimation(numberOfPulse: 15, radius: 200, postion: self.view.center)
        pulse.animationDuration = 1.0
        pulse.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        self.view.layer.insertSublayer(pulse, below: self.view.layer)
    }
    
    @IBAction func onClickGreenButton(_ sender: UIButton) {
        let pulse = pulseAnimation(numberOfPulse: Float.infinity, radius: 150, postion: sender.center)
        // pulse.animationDuration = 1.0
        
        pulse.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        self.view.layer.insertSublayer(pulse, below: self.view.layer)
    }
    
    
    
    func createPlayer ()  {
        guard let url = Bundle.main.url(forResource: "intro", withExtension: "mp4") else {
            print("url не найден")
            return
        }
        
        //        aVPlayer = AVPlayer(url: URL(fileURLWithPath: path))
        //        playerLayer = AVPlayerLayer(player: aVPlayer)
        //        playerLayer!.frame = self.view.bounds
        //        playerLayer!.videoGravity = .resizeAspectFill
        //        self.videoLayer.layer.addSublayer(playerLayer!)
        //        videoLayer.bringSubviewToFront(img)
        //        videoLayer.bringSubviewToFront(lbl)
        //        videoLayer.bringSubviewToFront(btn)
        
        //        var playerLooper: AVPlayerLooper! // should be defined in class
        //        var queuePlayer: AVQueuePlayer!
        
        
        // AVAsset with its 'duration' property value loaded
        let playerItem = AVPlayerItem(url: url)
        self.queuePlayer = AVQueuePlayer(playerItem: playerItem)
        
        // Create a new player looper with the queue player and template item
        self.playerLooper = AVPlayerLooper(player: queuePlayer, templateItem: playerItem)
        playerLayer = AVPlayerLayer(player: queuePlayer)
        
        playerLayer!.frame = self.view.bounds
        playerLayer!.videoGravity = .resizeAspectFill
        self.videoLayer.layer.addSublayer(playerLayer!)
        queuePlayer.play()
        
        
        //Loop
        //     aVPlayer?.actionAtItemEnd = .none
        //      NotificationCenter.default.addObserver(self, selector: #selector(rewindVideo(notification:)), name: .AVPlayerItemDidPlayToEndTime, object: aVPlayer?.currentItem)
    }
    @objc
    func rewindVideo(notification: Notification) {
        // aVPlayer?.seek(to: .zero)
    }
    //    override func layoutSubviews() {
    //           super.layoutSubviews()
    //           aVPlayer.frame = bounds
    //       }
    //
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        playerLayer?.frame = view.bounds
    }
    //MARK: - Работа с видео
    
    func playVideo() {
        //      guard let path = Bundle.main.path(forResource: "intr0", ofType: "mp4") else {
        //       return
        //       }
        //
        //       aVPlayer = AVPlayer(url: URL(fileURLWithPath: path))
        //      let playerLayer = AVPlayerLayer(player: aVPlayer)
        //      playerLayer.frame = self.view.bounds
        //      playerLayer.videoGravity = .resizeAspectFill
        //        self.videoLayer.layer.addSublayer(playerLayer)
        //
        videoLayer.bringSubviewToFront(img)
        videoLayer.bringSubviewToFront(lbl)
        videoLayer.bringSubviewToFront(btn)
         videoLayer.bringSubviewToFront(lble)
    }
}

