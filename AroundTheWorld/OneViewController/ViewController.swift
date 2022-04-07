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
    

    private var playerLayer: AVPlayerLayer?
    var playerLooper: AVPlayerLooper!
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
    
    //MARK: - Работа с анимацией кнопки, зацикливанием и реализацией перехода на новую сцену
    
    func showAnimation() {
        let pulse = pulseAnimation(numberOfPulse: 15, radius: 200, postion: self.view.center)
        pulse.animationDuration = 1.0
        pulse.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        self.view.layer.insertSublayer(pulse, below: self.view.layer)
    }
    
    @IBAction func onClickGreenButton(_ sender: UIButton) {
        let pulse = pulseAnimation(numberOfPulse: Float.infinity, radius: 150, postion: sender.center)
        pulse.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        self.view.layer.insertSublayer(pulse, below: self.view.layer)
    }
    
    
    
    func createPlayer ()  {
        guard let url = Bundle.main.url(forResource: "INTRO", withExtension: "mp4") else {
            print("url не найден")
            return
        }
        
        
        // AVAsset с загруженным значением свойства «длительность»
        let playerItem = AVPlayerItem(url: url)
        self.queuePlayer = AVQueuePlayer(playerItem: playerItem)
        
        // Создание нового проигрывателя с проигрывателем очереди и элементом шаблона.
        self.playerLooper = AVPlayerLooper(player: queuePlayer, templateItem: playerItem)
        playerLayer = AVPlayerLayer(player: queuePlayer)
        
        playerLayer!.frame = self.view.bounds
        playerLayer!.videoGravity = .resizeAspectFill
        self.videoLayer.layer.addSublayer(playerLayer!)
        queuePlayer.play()

    }
    @objc
    func rewindVideo(notification: Notification) {
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        playerLayer?.frame = view.bounds
    }
    
    
    //MARK: - Вывод компонентов на передний план
    
    func playVideo() {

        videoLayer.bringSubviewToFront(img)
        videoLayer.bringSubviewToFront(lbl)
        videoLayer.bringSubviewToFront(btn)
         videoLayer.bringSubviewToFront(lble)
    }
}

