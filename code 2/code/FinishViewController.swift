//
//  FinishViewController.swift
//  code
//
//  Created by Foundation-012 on 29/08/24.
//

import UIKit

class FinishViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    var isPasscodeCorrect: Bool = false
    
    let characterZee: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "happy_zee.png")
        return theImageView
    }()
    
    let characterDany: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "dany.png")
        return theImageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if isPasscodeCorrect {
                    titleLabel.text = "YOU SAVE HER"
            view.addSubview(characterZee)

                } else {
                    titleLabel.text = "GAME OVER"
                    view.addSubview(characterDany)
                }
            }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if isPasscodeCorrect {
            // Set initial position
            characterZee.frame = CGRect(x: self.view.center.x/2, y: self.view.center.y + self.view.center.y/2, width: 100, height: 100)

            // Animate to final position
            UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseInOut, animations: {
                self.characterZee.frame = CGRect(x: self.view.frame.width + 100, y: self.view.center.y + self.view.center.y/2, width: 100, height: 100)
            }, completion: nil)

        } else {
            // Set initial position
            characterDany.frame = CGRect(x: self.view.frame.width + 100, y: self.view.center.y + self.view.center.y/2, width: 100, height: 100)

            // Animate to final position
                UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseInOut, animations: {
                    self.characterDany.frame = CGRect(x: self.view.frame.width * 0.25, y: self.view.center.y + self.view.center.y/2, width: 100, height: 100)
                }, completion: nil)
        }
    }

    
    
    
    
}
