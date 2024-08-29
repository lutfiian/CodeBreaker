//
//  KitchenViewController.swift
//  code
//
//  Created by Foundation-012 on 25/08/24.
//

import UIKit

class KitchenViewController: UIViewController {
    @IBOutlet weak var boxImageView: UIImageView!
    @IBOutlet weak var cluePopupImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var line1Label: UILabel!
    @IBOutlet weak var line2Label: UILabel!
    @IBOutlet weak var answerTxtField: UITextField!
    @IBOutlet weak var sendImageView: UIImageView!
    
    var input = 0
    
    let character: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "sad_zee.png")
        return theImageView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBoxInteraction()
        setupPopupElements()

        view.addSubview(character)
        character.frame = CGRect(x: self.view.center.x - (300), y: self.view.center.y - (-30), width: 100, height: 100)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        animateBoxImageView()
    }
    
    private func setupPopupElements() {
        cluePopupImageView.isHidden = true
        titleLabel.isHidden = true
        line1Label.isHidden = true
        line2Label.isHidden = true
        answerTxtField.isHidden = true
        sendImageView.isHidden = true
    }
    
    private func setupBoxInteraction() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleBoxTapped))
        boxImageView.addGestureRecognizer(tapGesture)
        boxImageView.isUserInteractionEnabled = true
    }
    //manage clue and its attribute here
    @objc func handleBoxTapped() {
        cluePopupImageView.isHidden = false
        titleLabel.isHidden = false
        line1Label.isHidden = false
        line2Label.isHidden = false
        answerTxtField.isHidden = false
        sendImageView.isHidden = false
        
        cluePopupImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            UIView.animate(withDuration: 0.3, animations: {
                self.cluePopupImageView.transform = CGAffineTransform.identity
            })
    }
    
    private func animateBoxImageView() {
        let rotationAngle: CGFloat = .pi / 10  // set degrees
        let duration: TimeInterval = 0.4
        
        boxImageView.isUserInteractionEnabled = true
        
        UIView.animate(withDuration: duration,
                       delay: 0,
                       options: [.curveLinear],
                       animations: {
            self.boxImageView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        }) { finished in
            UIView.animate(withDuration: duration,
                        delay: 0,
                        options: [.curveLinear],
                        animations: {
            self.boxImageView.transform = CGAffineTransform(rotationAngle: -rotationAngle)
        }) { finished in
            UIView.animate(withDuration: duration,
                        delay: 0,
                        options: [.curveLinear],
                        animations: {
            self.boxImageView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        }, completion: { finished in
                    // Call the function again to repeat the animation
            self.boxImageView.transform = CGAffineTransform.identity
            })
        }
    }
}
    
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        }
    
    
    @IBAction func testButton(_ sender: Any) {
        print ("succeed")
        SoundManager.shared.PlayKlikButton()
        self.performSegue(withIdentifier: "unwindToMap", sender: self)
        
    }

}
