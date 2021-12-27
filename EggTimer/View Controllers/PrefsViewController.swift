//
//  PrefsViewController.swift
//  EggTimer
//
//  Created by Gabriel Chammas on 12/25/21.
//

import Cocoa

class PrefsViewController: NSViewController {
    @IBOutlet weak var presetsPopup: NSPopUpButton!
    @IBOutlet weak var customSlider: NSSlider!
    @IBOutlet weak var customTextField: NSTextField!
    @IBOutlet weak var playSoundCheckBox: NSButton!
    
    var prefs = Preferences()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        showExistingPrefs()
    }
    @IBAction func popupValueChanged(_ sender: NSPopUpButton) {
        if sender.selectedItem?.title == "Custom" {
            customSlider.isEnabled = true
            return
        }
        
        let newTimerDuration = sender.selectedTag()
        customSlider.integerValue = newTimerDuration
        showSliderValueAsText()
        customSlider.isEnabled = false
    }
    @IBAction func sliderValueChanged(_ sender: Any) {
        showSliderValueAsText()
    }
    @IBAction func cancelButtonClicked(_ sender: Any) {
        view.window?.close()
    }
    @IBAction func okButtonClicked(_ sender: Any) {
        savePrefs()
        view.window?.close()
    }
    
    func showExistingPrefs() {
        let selectedTimeInMinutes = Int(prefs.selectedTime) / 60
        
        presetsPopup.selectItem(withTitle: "Custom")
        customSlider.isEnabled = true
        
        for item in presetsPopup.itemArray {
            if item.tag == selectedTimeInMinutes {
                presetsPopup.select(item)
                customSlider.isEnabled = false
                break
            }
        }
        
        customSlider.integerValue = selectedTimeInMinutes
        showSliderValueAsText()
        
        playSoundCheckBox.state = prefs.playSound ? .on : .off
    }
    
    func showSliderValueAsText() {
        let newTimerDuration = customSlider.integerValue
        let minutesDescription = (newTimerDuration == 1) ? "minute": "minutes"
        customTextField.stringValue = "\(newTimerDuration) \(minutesDescription)"
    }
    
    func savePrefs() {
        prefs.selectedTime = customSlider.doubleValue * 60
        NotificationCenter.default.post(name: Notification.Name("PrefsChanged"), object: nil)
        prefs.playSound = playSoundCheckBox.state == .on ? true : false
        NotificationCenter.default.post(name: Notification.Name("PlaySound"), object: nil)
    }
    
}
