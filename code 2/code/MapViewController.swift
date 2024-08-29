//
//  MapViewController.swift
//  code
//
//  Created by Foundation-012 on 19/08/24.
//

import UIKit

class MapViewController: UIViewController {

    @IBOutlet weak var bathroomImageView: UIImageView!
    @IBOutlet weak var bedroom1ImageView: UIImageView!
    @IBOutlet weak var bedroom2ImageView: UIImageView!
    @IBOutlet weak var dineroomImageView: UIImageView!
    @IBOutlet weak var kitchenImageView: UIImageView!
    @IBOutlet weak var livingImageView: UIImageView!
    
    @IBOutlet weak var notesImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                // Set up tap gesture recognizers for each room
                let roomImageViews = [bathroomImageView, bedroom1ImageView, bedroom2ImageView, dineroomImageView, kitchenImageView, livingImageView]
                
                for roomImageView in roomImageViews {
                    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleRoomTap(_:)))
                    roomImageView?.isUserInteractionEnabled = true
                    roomImageView?.addGestureRecognizer(tapGesture)
                }

                // Set up tap gesture recognizer for notes icon
                let notesTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleNotesTap))
                notesImageView.isUserInteractionEnabled = true
                notesImageView.addGestureRecognizer(notesTapGesture)
            }

            @objc func handleRoomTap(_ sender: UITapGestureRecognizer) {
                guard let tappedRoom = sender.view as? UIImageView else { return }
                performSegue(withIdentifier: "showRoom", sender: tappedRoom)
            }

            @objc func handleNotesTap() {
                // Show the quest notes when the notes icon is tapped
               // showNotesPopup()
            }

            //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
              //  if segue.identifier == "showRoom",
                //   let roomVC = segue.destination as? roomViewController,
                  // let roomImageView = sender as? UIImageView {
                    //roomVC.roomImageView  = roomImageView
          //  }

    

    

}
