//
//  ViewController.swift
//  iTunesPlayer
//
//  Created by Arthur Pankiewicz on 2016-01-28.
//  Copyright © 2016 Arthur Pankiewicz. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {

    
    var music: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Play sound
        let path = NSBundle.mainBundle().pathForResource("music.mp3", ofType: nil)!
        let url = NSURL(fileURLWithPath: path)
        
        let check = isPlaying()
        
        do {
            if check == false {
                let sound = try AVAudioPlayer(contentsOfURL: url)
                music = sound
                sound.play()
            }
        }
        catch {
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func isPlaying() -> Bool {
        let musicPlayer = MPMusicPlayerController.systemMusicPlayer()
        if musicPlayer.playbackState == MPMusicPlaybackState.Playing {
            return true
        }
        return false
    }

}

