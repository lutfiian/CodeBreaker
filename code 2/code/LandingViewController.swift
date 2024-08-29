//
//  LandingViewController.swift
//  code
//
//  Created by Foundation-012 on 16/08/24.
//

import UIKit

class LandingViewController: UIViewController {
    @IBOutlet weak var speakerImageView: UIImageView!
    
    var isMute = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the viewc.
    }
    @IBAction func onSpeakerTap(_ sender: Any) { isMute.toggle()
        
        if isMute {
            speakerImageView.image = UIImage(systemName: "speaker.slash.circle.fill")
            SoundManager.shared.stopGamePlay()
        }
        else {
            speakerImageView.image = UIImage(systemName: "speaker.wave.2.fill")
            SoundManager.shared.PlayGamePlay()
        }
    }
    
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
