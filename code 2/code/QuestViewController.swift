//
//  QuestViewController.swift
//  code
//
//  Created by Foundation-012 on 25/08/24.
//

import UIKit

class QuestViewController: UIViewController {

    
    @IBOutlet weak var notesPopupImageView: UIImageView!
    private var stackView: UIStackView!
    
    var quests: [String] = [
        "1. Go to bathroom",
        "2. Go to dineroom",
        "3. Go to kitchen",
        "4. Go to bedroom 1",
        "5. Go to bedroom 2"
    ]
    var answers: [String] = ["","","","",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    private func setupNotesPopupView() {
        notesPopupImageView.isHidden = true
        stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        notesPopupImageView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: notesPopupImageView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: notesPopupImageView.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: notesPopupImageView.widthAnchor, multiplier: 0.5),
            stackView.heightAnchor.constraint(equalTo: notesPopupImageView.heightAnchor, multiplier: 0.5)
        ])
        
        updateStackView()
    }
    
    private func updateStackView() {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        let titleLabel = UILabel()
        titleLabel.text = "Follow and see your answer here!"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.numberOfLines = 1
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.5
        stackView.addArrangedSubview(titleLabel)
        
        for (index, quest) in quests.enumerated() {
            let questLabel = UILabel()
            questLabel.numberOfLines = 0
            questLabel.text = "\(quest) : \(answers[index])"
            stackView.addArrangedSubview(questLabel)
        }
    }

}
