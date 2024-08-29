//
//  DineroomViewController.swift
//  code
//
//  Created by Foundation-012 on 25/08/24.
//

import UIKit

class DineroomViewController: UIViewController {

    @IBOutlet weak var cluePopupImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var line1Label: UILabel!
    @IBOutlet weak var line2Label: UILabel!
    @IBOutlet weak var answerTxtField: UITextField!
    @IBOutlet weak var sendImageView: UIImageView!
    
    @IBOutlet weak var trashbinImageView: UIImageView!
    
    var input = 0
    var mapViewController: MapViewController?
    
    let character: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "sad_zee.png")
        return theImageView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTrashbinInteraction()
        setupPopupElements()

        view.addSubview(character)
        character.frame = CGRect(x: self.view.center.x - 300, y: self.view.center.y - (-10), width: 100, height: 100)

    }
    override func viewDidAppear(_ animated: Bool) {
        animateTrashbinImageView()
    }
    
    private func setupPopupElements() {
        cluePopupImageView.isHidden = true
        titleLabel.isHidden = true
        line1Label.isHidden = true
        line2Label.isHidden = true
        answerTxtField.isHidden = true
        sendImageView.isHidden = true
    }
    
    private func setupTrashbinInteraction() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTrashbinTapped))
        trashbinImageView.addGestureRecognizer(tapGesture)
        trashbinImageView.isUserInteractionEnabled = true
    }
    //manage clue and its attribute here
    @objc func handleTrashbinTapped() {
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

    
    private func animateTrashbinImageView() {
        let rotationAngle: CGFloat = .pi / 16  // set degrees
        let duration: TimeInterval = 0.4
        
        trashbinImageView.isUserInteractionEnabled = true
        
        UIView.animate(withDuration: duration,
                       delay: 0,
                       options: [.curveLinear],
                       animations: {
            self.trashbinImageView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        }) { finished in
            UIView.animate(withDuration: duration,
                        delay: 0,
                        options: [.curveLinear],
                        animations: {
            self.trashbinImageView.transform = CGAffineTransform(rotationAngle: -rotationAngle)
        }) { finished in
            UIView.animate(withDuration: duration,
                        delay: 0,
                        options: [.curveLinear],
                        animations: {
            self.trashbinImageView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        }, completion: { finished in
                    // Call the function again to repeat the animation
            self.trashbinImageView.transform = CGAffineTransform.identity
            })
        }
    }
}
    
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

        }
    
    @IBAction func submitButton(_ sender: Any) {
        print ("succeed")
        SoundManager.shared.PlayKlikButton()
        input = Int(answerTxtField.text ?? "0") ?? 0
        self.performSegue(withIdentifier: "unwindToMap", sender: self)
        
    }
    
        

}
