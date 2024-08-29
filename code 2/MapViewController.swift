//
//  MapViewController.swift
//  code
//
//  Created by Foundation-012 on 20/08/24.
//

import UIKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var livingBtn: UIButton!
    @IBOutlet weak var dinnerBtn: UIButton!
    @IBOutlet weak var kitchenBtn: UIButton!
    @IBOutlet weak var bedroom2Btn: UIButton!
    @IBOutlet weak var bedroom1Btn: UIButton!
    @IBOutlet weak var toiletBtn: UIButton!
    @IBOutlet weak var closeImageView: UIImageView!
    @IBOutlet weak var notesImageView: UIImageView!
    
    @IBOutlet weak var notesPopupImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var quest1Label: UILabel!
    @IBOutlet weak var quest2Label: UILabel!
    @IBOutlet weak var quest3Label: UILabel!
    @IBOutlet weak var quest4Label: UILabel!
    @IBOutlet weak var quest5Label: UILabel!
    
    @IBOutlet weak var doorImageView: UIImageView!
    
    
    var quests: [String] = [
        "1. Go to toilet",
        "2. Go to dineroom",
        "3. Go to kitchen",
        "4. Go to bedroom 1",
        "5. Go to bedroom 2"
    ]
    var answers: [String] = ["","","","",""]
    
    let character: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "sad_zee.png")
        return theImageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNotesInteraction()
        setupNotesPopupView()
        setupCloseInteraction()
        setupLabels()

        view.addSubview(character)
        character.frame = CGRect(x: self.view.center.x, y: self.view.center.y, width: 70, height: 70)
        //set the navbar hidden
        self.navigationController?.navigationBar.isHidden = true
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1) {
            self.character.center = self.view.center
        }
    }
    
    private func setupLabels() {
        titleLabel.text = "Follow and see your answer here!"
        //updateLabels()
    }
    
    
    private func setupNotesInteraction() {
        let notestapGesture = UITapGestureRecognizer(target: self, action: #selector(handleNotesTap))
        notesImageView.addGestureRecognizer(notestapGesture)
        notesImageView.isUserInteractionEnabled = true
    }
    
    @objc func handleNotesTap() {
        //dimView.isHidden = false
        notesPopupImageView.isHidden = false
        closeImageView.isHidden = false
        titleLabel.isHidden = false
        quest1Label.isHidden = false
        quest2Label.isHidden = false
        quest3Label.isHidden = false
        quest4Label.isHidden = false
        quest5Label.isHidden = false
        character.isHidden = true
    }
    
    private func setupNotesPopupView() {
        notesPopupImageView.isHidden = true
        closeImageView.isHidden = true
        titleLabel.isHidden = true
        quest1Label.isHidden = true
        quest2Label.isHidden = true
        quest3Label.isHidden = true
        quest4Label.isHidden = true
        quest5Label.isHidden = true
        character.isHidden = true
        print("pop up success")
    }
    
    
    private func setupCloseInteraction() {
        let closeTapGesture = UITapGestureRecognizer(target: self, action: #selector(closeNotesPopup))
        closeImageView.addGestureRecognizer(closeTapGesture)
        closeImageView.isUserInteractionEnabled = true
        character.isHidden = false
        
    }
    @objc func closeNotesPopup() {
        //dimView.isHidden = true
        notesPopupImageView.isHidden = true
        closeImageView.isHidden = true
        titleLabel.isHidden = true
        quest1Label.isHidden = true
        quest2Label.isHidden = true
        quest3Label.isHidden = true
        quest4Label.isHidden = true
        quest5Label.isHidden = true
        character.isHidden = false
        print("success")
    }
    
    
    @IBAction func unwindToMap(_ sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ToiletViewController {
            if let data = sourceViewController.answerTxtField.text{
                quest1Label.text = "1. Go to toilet :  \(data)"
                print("received data: \(data)")
            }
        } else if let sourceViewController = sender.source as? DineroomViewController {
            if let data = sourceViewController.answerTxtField.text {
                quest2Label.text = "2. Go to dineroom : \(data)"
                print("Received data from dineroom: \(data)")
            }
        } else if let sourceViewController = sender.source as? KitchenViewController {
            if let data = sourceViewController.answerTxtField.text {
                quest3Label.text = "3. Go to kitchen : \(data)"
                print("Received data from kitchen: \(data)")
            }
        } else if let sourceViewController = sender.source as? Bedroom1ViewController {
            if let data = sourceViewController.answerTxtField.text {
                quest4Label.text = "2. Go to bedroom 1 : \(data)"
                print("Received data from bedroom1: \(data)")
            }
        } else if let sourceViewController = sender.source as? Bedroom2ViewController {
            if let data = sourceViewController.answerTxtField.text {
                quest5Label.text = "2. Go to bedroom 2 : \(data)"
                print("Received data from bedroom2: \(data)")
            }
        } else if sender.source is LivingroomViewController {
            
        }
    }
    
    
    //set character move to bedroom1
        
        @IBAction func bed1BtnTapped(_ sender: Any) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewC = storyboard.instantiateViewController(withIdentifier: "Bedroom1ViewController")
            if let navController = self.navigationController {
                print("Navigation controller exists")
                SoundManager.shared.PlayMasukRuangan()
                
                // Set character animation with linear curve to avoid bounce-back
                UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
                    self.character.center = CGPoint(x: self.character.center.x - 90, y: self.character.center.y)
                }) { val in
                    UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
                        self.character.center = self.bedroom1Btn.center
                    }) { val in navController.pushViewController(viewC, animated: true)
                    }
                }
            }
        }
        
   
        @IBAction func bed2BtnTapped(_ sender: Any) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewC = storyboard.instantiateViewController(withIdentifier: "Bedroom2ViewController")
            if let navController = self.navigationController {
                print("Navigation controller exists")
                SoundManager.shared.PlayMasukRuangan()
                
                // Set character animation with linear curve to avoid bounce-back
                UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
                    self.character.center = CGPoint(x: self.character.center.x - 80, y: self.character.center.y)
                }) { val in
                    UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
                        self.character.center = CGPoint(x: self.character.center.x, y: self.character.center.y - (-100))
                    }) { val in
                        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
                            self.character.center = CGPoint(x: self.character.center.x - 100, y: self.character.center.y)
                        }) { val in
                            UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
                                self.character.center = self.bedroom2Btn.center
                            }) { val in navController.pushViewController(viewC, animated: true)
                            }
                        }
                    }
                }
            }
        }
        
    @IBAction func toiletBtnTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewC = storyboard.instantiateViewController(withIdentifier: "ToiletViewController")
        if let navController = self.navigationController {
            print("Navigation controller exists")
            SoundManager.shared.PlayMasukRuangan()
            
            // Set character animation with linear curve to avoid bounce-back
            UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
                self.character.center = CGPoint(x: self.character.center.x - 20, y: self.character.center.y)
            }) { val in
                UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
                    self.character.center = CGPoint(x: self.character.center.x, y: self.character.center.y - 100)
                }) { val in
                    UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
                        self.character.center = CGPoint(x: self.character.center.x - 100, y: self.character.center.y)
                    }) { val in
                        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
                            self.character.center = self.toiletBtn.center
                        }) { val in navController.pushViewController(viewC, animated: true)
                        }
                    }
                }
            }
        }
    }
    
        
        @IBAction func kitchenBtnTapped(_ sender: Any) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewC = storyboard.instantiateViewController(withIdentifier: "KitchenViewController")
            if let navController = self.navigationController {
                print("Navigation controller exists")
                SoundManager.shared.PlayMasukRuangan()
                
                // Set character animation with linear curve to avoid bounce-back
                UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
                    self.character.center = CGPoint(x: self.character.center.x + 90, y: self.character.center.y)
                }) { val in
                    UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
                        self.character.center = CGPoint(x: self.character.center.x, y: self.character.center.y - 100)
                    }) { val in
                        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
                            self.character.center = CGPoint(x: self.character.center.x + 90, y: self.character.center.y)
                        }) { val in
                            UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
                                self.character.center = self.kitchenBtn.center
                            }) { val in navController.pushViewController(viewC, animated: true)
                            }
                        }
                    }
                }
            }
        }
                
                @IBAction func dinnerBtnTapped(_ sender: Any) {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewC = storyboard.instantiateViewController(withIdentifier: "DineroomViewController")
                    if let navController = self.navigationController {
                        print("Navigation controller exists")
                        SoundManager.shared.PlayMasukRuangan()
                        
                        // Set character animation with linear curve to avoid bounce-back
                        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
                            self.character.center = CGPoint(x: self.character.center.x + 90, y: self.character.center.y)
                        }) { val in
                            UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
                                self.character.center = self.dinnerBtn.center
                            }) { val in navController.pushViewController(viewC, animated: true)
                            }
                        }
                    }
                }
   
                @IBAction func livngBtnTapped(_ sender: Any) {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewC = storyboard.instantiateViewController(withIdentifier: "LivingroomViewController")
                    if let navController = self.navigationController {
                        print("Navigation controller exists")
                        SoundManager.shared.PlayMasukRuangan()
                        
                        // Set character animation with linear curve to avoid bounce-back
                        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
                            self.character.center = CGPoint(x: self.character.center.x + 130, y: self.character.center.y)
                        }) { val in
                            UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
                                self.character.center = CGPoint(x: self.character.center.x, y: self.character.center.y + 100)
                            }) { val in
                                UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
                                    self.character.center = CGPoint(x: self.character.center.x + 90, y: self.character.center.y)
                                }) { val in
                                    UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
                                        self.character.center = self.livingBtn.center
                                    }) { val in navController.pushViewController(viewC, animated: true)
                                    }
                                }
                            }
                        }
                    }
                }
            
}
