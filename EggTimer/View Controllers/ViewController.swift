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
    
    var eggTimer = EggTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        eggTimer.delegate = self
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

extension ViewController: EggTimerProtocol {
    
    func timeRemainingOnTimer(_ timer: EggTimer, timeRemaining: TimeInterval) {
        updateDisplay(for: timeRemaining)
    }
    
    func timerHasFinished(_ timer: EggTimer) {
        updateDisplay(for: 0)
    }
}

extension ViewController {
    //MARK: Display
    
    func updateDisplay(for timeRemaining: TimeInterval) {
        timeLeftField.stringValue = textToDisplay(for: timeRemaining)
        eggImageView.image = imageToDisplay(for: timeRemaining)
    }
    
    private func textToDisplay(for timeRemaining: TimeInterval) -> String {
        if timeRemaining == 0 {
            return "Done!"
        }
        
        let minutesRemaining = floor(timeRemaining / 60)
        let secondsRemaining = timeRemaining - (minutesRemaining * 60)
        
        let secondsDisplay = String(format: "%02d", Int(secondsRemaining))
        return "\(Int(minutesRemaining)):\(secondsDisplay)"
    }
    
    private func imageToDisplay(for timeRemaining: TimeInterval) -> NSImage? {
        let percentageComplete = 100 - (timeRemaining / 360 * 100)
        
        if eggTimer.isStopped {
            let stoppedImageName = (timeRemaining == 0) ? "100": "stopped"
            return NSImage(named: stoppedImageName)
        }
        
        let imageName: String
        switch percentageComplete {
        case 0..<25:
            imageName = "0"
            
        case 25..<50:
            imageName = "25"
            
        case 50..<75:
            imageName = "50"
            
        case 75..<100:
            imageName = "75"
            
        default:
            imageName = "100"
        }
        
        return NSImage(named: imageName)
    }
}
