//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        guard let buttonText = sender.titleLabel?.text else { return }
        playSound(soundURL: buttonText)
        applyOpacityEffect(button: sender)
    }
    
    func applyOpacityEffect(button: UIButton) {
        button.layer.opacity = 0.8
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            button.layer.opacity = 1
        }
    }
    
    func playSound(soundURL: String) {
        let url = Bundle.main.url(forResource: soundURL, withExtension: "wav")
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

