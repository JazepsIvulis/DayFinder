//
//  SettingsViewController.swift
//  DayFinder
//
//  Created by jazeps.ivulis on 13/04/2023.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelText()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func openSettingsTapped(_ sender: Any) {
        openSettings()
    }

    func openSettings() {
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {return}
        if UIApplication.shared.canOpenURL(settingsURL) {
            UIApplication.shared.open(settingsURL)
        }
    }
    
    func setLabelText() {
        var text = "Unable to set mode"
        if self.traitCollection.userInterfaceStyle == .dark {
            text = "Dark Mode On"
        }else{
            text = "Light Mode On"
        }
        textLabel.text = text
    }
}

extension SettingsViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setLabelText()
    }
}
