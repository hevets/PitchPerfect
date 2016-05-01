//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Steve Henderson on 2016-04-30.
//  Copyright © 2016 Steve Henderson. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var darthVaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!
    
    enum ButtonType: Int { case Slow = 0, Fast, Chipmunk, Vader, Echo, Reverb }
    
    var recordedAudioURL: NSURL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        setupNavBar()
    }
    
    override func viewWillAppear(animated: Bool) {
        configureUI(.NotPlaying)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSoundForButton(sender: UIButton) {
        switch ButtonType(rawValue: sender.tag)! {
        case .Slow:
            playSound(rate: 0.5)
        case .Fast:
            playSound(rate: 1.5)
        case .Chipmunk:
            playSound(pitch: 1000)
        case .Vader:
            playSound(pitch: -1000)
        case .Echo:
            playSound(echo: true)
        case .Reverb:
            playSound(reverb: true)
        }
        
        configureUI(.Playing)
    }
    
    @IBAction func stopButtonPressed(sender: AnyObject) {
        print("Stop audio button pressed")
        stopAudio()
    }
    
    func setupNavBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        let audioPlayer = try? AVAudioPlayer(contentsOfURL: self.audioFile.url)
        // set the duration of the audiofile
        if let duration = audioPlayer?.duration {
            self.navigationItem.title = String(format: "%.0f seconds", duration)
        }
    }
    
}
