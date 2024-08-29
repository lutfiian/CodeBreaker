//
//  ToiletViewController.swift
//  code
//
//  Created by Foundation-012 on 25/08/24.
//

import UIKit

class ToiletViewController: UIViewController {
    @IBOutlet weak var bucketImageView: UIImageView!
    @IBOutlet weak var cluePopupImageView: UIImageView!
    @IBOutlet weak var answerTxtField: UITextField!
    @IBOutlet weak var sendImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var line1Label: UILabel!
    @IBOutlet weak var line2Label: UILabel!
    
    var input = 0
    
    var mapViewController: MapViewController?
    
    let character: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "sad_zee.png")
        return theImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBucketInteraction()
        setupPopupElements()
        
        view.addSubview(character)
        character.frame = CGRect(x: self.view.center.x - (-230), y: self.view.center.y - (-70), width: 100, height: 100)
    }
    override func viewDidAppear(_ animated: Bool) {
        animateBucketImageView()
    }
    
    
    
    private func setupPopupElements() {
        cluePopupImageView.isHidden = true
        titleLabel.isHidden = true
        line1Label.isHidden = true
        line2Label.isHidden = true
        answerTxtField.isHidden = true
        sendImageView.isHidden = true
    }
    
    private func setupBucketInteraction() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleBucketTapped))
        bucketImageView.addGestureRecognizer(tapGesture)
        bucketImageView.isUserInteractionEnabled = true
    }
    //manage clue and its attribute here
    @objc func handleBucketTapped() {
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
    
    private func animateBucketImageView() {
        let rotationAngle: CGFloat = .pi / 12  // set degrees
        let duration: TimeInterval = 0.4
        
        bucketImageView.isUserInteractionEnabled = true
        
        UIView.animate(withDuration: duration,
                       delay: 0,
                       options: [.curveLinear],
                       animations: {
            self.bucketImageView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        }) { finished in
            UIView.animate(withDuration: duration,
                        delay: 0,
                        options: [.curveLinear],
                        animations: {
            self.bucketImageView.transform = CGAffineTransform(rotationAngle: -rotationAngle)
        }) { finished in
            UIView.animate(withDuration: duration,
                        delay: 0,
                        options: [.curveLinear],
                        animations: {
            self.bucketImageView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        }, completion: { finished in
                    // Call the function again to repeat the animation
            self.bucketImageView.transform = CGAffineTransform.identity
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
        input = Int(answerTxtField.text ?? "0") ?? 0
        self.performSegue(withIdentifier: "unwindToMap", sender: self)
        
        
    }
}
