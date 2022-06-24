//
//  ViewController.swift
//  MyMusic
//
//  Created by Wahid on 24/06/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    private var _player: AVAudioPlayer?
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopButton.disable()
        playButton.enable()
        
        guard let url = Bundle.main.url(forResource: "abu_usamah", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            
                /* Kode ini untuk iOS 11 ke atas */
                _player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                     
                /* Sedangkan untuk iOS 10 ke bawah gunakan ini:
                _player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            } catch let error {
            print(error.localizedDescription)
        }
        
    }


    @IBAction func playMusic(_ sender: UIButton) {
        guard let player = _player else {return}
        player.play()
        stopButton.disable()
        playButton.enable()

    }
    
    @IBAction func stopMusic(_ sender: UIButton) {
        guard let player = _player else {return}
        player.stop()
        stopButton.disable()
        playButton.enable()
    }
}

extension UIButton {
    func enable() {
        self.isEnabled = true
    }
    
    func disable() {
        self.isEnabled = false
    }
}
