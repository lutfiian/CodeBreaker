//
//  PasscodeViewController.swift
//  code
//
//  Created by Foundation-012 on 28/08/24.
//

import UIKit

class PasscodeViewController: UIViewController {
    
    @IBOutlet weak var passcodeStackView: UIStackView!
    
    private var enteredPasscode: [String] = []
    private let correctPass = ["9","8", "5", "6", "7"]
    private var chances = 3
    private var isPasscodeCorrect = false
    private var gameOver = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    private func updatePasscodeViews() {
        for (index, view) in passcodeStackView.arrangedSubviews.enumerated() {
            if index < enteredPasscode.count {
                let label = UILabel(frame: view.bounds)
                label.text = enteredPasscode[index]
                label.textAlignment = .center
                view.addSubview(label)
            } else {
                view.subviews.forEach { $0.removeFromSuperview() }
            }
        }
    }
    
    private func resetPasscodeViews() {
        guard let stackView = passcodeStackView else { return }
        for view in stackView.arrangedSubviews {
            view.subviews.forEach { $0.removeFromSuperview() }
        }
        enteredPasscode.removeAll()
    }
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else { return }
        if enteredPasscode.count < passcodeStackView.arrangedSubviews.count {
            enteredPasscode.append(number)
            updatePasscodeViews()
        }
    }
    
    private func showAlert(message: String, isSuccess: Bool) {
        let alert = UIAlertController(title: isSuccess ? "Congratulation!" : "T_T",
                                      message: message,preferredStyle: .alert)
        
        let actionTitle = isSuccess ? "Ok" : "Try Again"
        let action = UIAlertAction(title: actionTitle, style: .default) { _ in
            if isSuccess {
                self.performSegue(withIdentifier: "finishSegue", sender: self) //CHANGEEEE
            }
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
   
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        if enteredPasscode == correctPass {
            isPasscodeCorrect = true
            print("pass correct")
            SoundManager.shared.PlayGameOver()
            showAlert(message: "You're Right!🥳", isSuccess: true)
            performSegue(withIdentifier: "finishSegue", sender: self)
        } else {
            print("You're wrong!😭 Chances left: \(chances)")
            SoundManager.shared.PlaySalahMasukinCode()
            chances -= 1
            resetPasscodeViews()
            
            if chances == 0 {
                print("all wrong!")
                isPasscodeCorrect = false
                performSegue(withIdentifier: "finishSegue", sender: self)
            } else {
                showAlert(message: "Incorrect passcode! Remaining chances: \(chances)", isSuccess: false)
            }
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "finishSegue" {
            if let finishVC = segue.destination as? FinishViewController {
                finishVC.isPasscodeCorrect = isPasscodeCorrect
            }
            
        }
    }
}

