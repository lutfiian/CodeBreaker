//
//  StoryViewController.swift
//  code
//
//  Created by Foundation-012 on 15/08/24.
//

import UIKit

class StoryViewController: UIViewController {
    @IBOutlet weak var line1Label: UILabel!
    @IBOutlet weak var line2Label: UILabel!
    @IBOutlet weak var line3Label: UILabel!
    @IBOutlet weak var line4Label: UILabel!
    @IBOutlet weak var line5Label: UILabel!
    @IBOutlet weak var line6Label: UILabel!
    
    
    @IBOutlet weak var nextImageView: UIImageView!
    @IBOutlet weak var skipImageView: UIImageView!
  
    var linesOfText: [String] = [
        "Seorang anak perempuan bernama zee telah diculik.",
        "Zee terkurung dirumah terkunci",
        "Zee menjelajahi rumah dan menemukan kertas",
        "yang berisi teka-teki.",
        "Bantu zee temukan kode-kode",
        "agar dapat membuka pintu."
    ]
    
    var currentLabelIndex = 0
    var currentCharacterIndex = 0
    var typingTimer: Timer?
    
    var labels: [UILabel] {
        return[line1Label, 
               line2Label,
               line3Label,
               line4Label,
               line5Label,
               line6Label]
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //clear all labels
        labels.forEach{$0.text = ""}
        
        nextImageView.isHidden = true
        
        // Add tap gesture to the skipButton
        let skipTapGesture = UITapGestureRecognizer(target: self, action: #selector(skipTypingAnimation))
        skipImageView.isUserInteractionEnabled = true
        skipImageView.addGestureRecognizer(skipTapGesture)
    
        startTextAnimation()
        
    }
    
    func startTextAnimation() {
        typingTimer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(updateTypingLabel), userInfo: nil, repeats: true)
    }
    
        
    
    @objc func updateTypingLabel() {
        guard currentLabelIndex < labels.count else {
                    typingTimer?.invalidate()
                    // Show the "Next" ImageView when the story finishes
                    nextImageView.isHidden = false
                    return
        }
        
        let currentLabel =  labels[currentLabelIndex]
        let currentLineText = linesOfText[currentLabelIndex]
        
        if currentCharacterIndex < currentLineText.count {
            let index = currentLineText.index(currentLineText.startIndex,
            offsetBy: currentCharacterIndex)
            currentLabel.text?.append(currentLineText[index])
            currentCharacterIndex += 1
        } else {
            currentCharacterIndex = 0
            currentLabelIndex += 1
        }
    }
    
    @objc func skipTypingAnimation() {
        typingTimer?.invalidate()
        
        for (index, label) in labels.enumerated() {
            if index < linesOfText.count {
                label.text = linesOfText[index]
            }
        }
        
        //reset typing indexes
        currentLabelIndex = labels.count
        currentCharacterIndex = 0
        
        nextImageView.isHidden = false
    }
  
}
