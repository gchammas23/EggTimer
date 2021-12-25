//
//  ViewController.swift
//  EggTimer
//
//  Created by Gabriel Chammas on 12/23/21.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var timeLeftField: NSTextField!
    @IBOutlet weak var eggImageView: NSImageView!
    @IBOutlet weak var startButton: NSButton!
    @IBOutlet weak var stopButton: NSButton!
    @IBOutlet weak var resetButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @IBAction func startButtonClicked(_ sender: Any) {
    }
    
    @IBAction func stopButtonClicked(_ sender: Any) {
    }
    
    @IBAction func resetButtonClicked(_ sender: Any) {
    }
    
    @IBAction func startTimeMenuItemSelected(_ sender: Any) {
        startButtonClicked(sender)
    }
    
    @IBAction func stopTimeMenuItemSelected(_ sender: Any) {
        stopButtonClicked(sender)
    }
    
    @IBAction func resetTimeMenuItemSelected(_ sender: Any) {
        resetButtonClicked(sender)
    }
}

