//
//  LivingroomViewController.swift
//  code
//
//  Created by Foundation-012 on 25/08/24.
//

import UIKit

class LivingroomViewController: UIViewController {
    
    let character: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "sad_zee.png")
        return theImageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        view.addSubview(character)
        character.frame = CGRect(x: self.view.center.x - 300, y: self.view.center.y - (-30), width: 100, height: 100)

    }
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

        }


        

}
