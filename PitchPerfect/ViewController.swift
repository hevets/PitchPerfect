//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Steve Henderson on 2016-04-28.
//  Copyright © 2016 Steve Henderson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        stopRecordingButton.enabled = false
    }
    
    @IBAction func recordAudio(sender: AnyObject) {
        print("record button was pressed")
        recordingLabel.text = "Recording in Progress"
        toggleRecording(true)
    }

    @IBAction func stopRecording(sender: AnyObject) {
        print("stop record button was pressed")
        toggleRecording(false)
    }
    
    /** 
    Toggles recording and stoprecording button states
    Updates recording state text on recordingLabel
    */
    func toggleRecording(isRecording: Bool) {
        recordButton.enabled = !isRecording
        stopRecordingButton.enabled = isRecording
        recordingLabel.text = isRecording ? "Recording in Progress" : "Tap to Record"
    }
}

