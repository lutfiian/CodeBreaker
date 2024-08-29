//
//  SoundManager.swift
//  code
//
//  Created by Foundation-018 on 28/08/24.
//

import AVFoundation

class SoundManager{
    var player1 : AVAudioPlayer?
    var player2 : AVAudioPlayer?
    var player3 : AVAudioPlayer?
    var player4 : AVAudioPlayer?
    var player5 : AVAudioPlayer?
    var player6 : AVAudioPlayer?
    var player7 : AVAudioPlayer?
    var player8 : AVAudioPlayer?
    var player9 : AVAudioPlayer?
    
    static let shared = SoundManager()
    
    func PlayInputPasscode(){
        //alamat file audionya
        let alamat = Bundle.main.path(forResource: "inputPasscode", ofType: "mp3")
        //ubah alamat jadi url
        let url = URL(fileURLWithPath: alamat!)
        
        do{
            player1 = try AVAudioPlayer(contentsOf: url)
            player1?.play()
        }catch{
            
        }
    }
    
    func PlayGameOver(){
        //alamat file audionya
        let alamat = Bundle.main.path(forResource: "gameOver", ofType: "mp3")
        //ubah alamat jadi url
        let url = URL(fileURLWithPath: alamat!)
        
        do{
            player2 = try AVAudioPlayer(contentsOf: url)
            player2?.play()
        }catch{
            
        }
    }
    
    func PlayGamePlay(){
        //alamat file audionya
        let alamat = Bundle.main.path(forResource: "gamePlay", ofType: "mp3")
        //ubah alamat jadi url
        let url = URL(fileURLWithPath: alamat!)
        
        do{
            player3 = try AVAudioPlayer(contentsOf: url)
            player3?.play()
        }catch{
            
        }
    }
    
    func stopGamePlay(){
        player3?.stop()
    }
    
    func PlayKlikButton(){
        //alamat file audionya
        let alamat = Bundle.main.path(forResource: "klikButton", ofType: "mp3")
        //ubah alamat jadi url
        let url = URL(fileURLWithPath: alamat!)
        
        do{
            player4 = try AVAudioPlayer(contentsOf: url)
            player4?.play()
        }catch{
            
        }
    }
    
    func PlayKlikNotesAndClue(){
        //alamat file audionya
        let alamat = Bundle.main.path(forResource: "klikClue", ofType: "mp3")
        //ubah alamat jadi url
        let url = URL(fileURLWithPath: alamat!)
        
        do{
            player5 = try AVAudioPlayer(contentsOf: url)
            player5?.play()
        }catch{
            
        }
    }
    
    func PlayMasukRuangan(){
        //alamat file audionya
        let alamat = Bundle.main.path(forResource: "masukRuangan", ofType: "mp3")
        //ubah alamat jadi url
        let url = URL(fileURLWithPath: alamat!)
        
        do{
            player6 = try AVAudioPlayer(contentsOf: url)
            player6?.play()
        }catch{
            
        }
    }
    
    func PlayPenculikDatang(){
        //alamat file audionya
        let alamat = Bundle.main.path(forResource: "penculikDatang", ofType: "mp3")
        //ubah alamat jadi url
        let url = URL(fileURLWithPath: alamat!)
        
        do{
            player7 = try AVAudioPlayer(contentsOf: url)
            player7?.play()
        }catch{
            
        }
    }
    
    func PlaySalahMasukinCode(){
        //alamat file audionya
        let alamat = Bundle.main.path(forResource: "salahMasukinCode", ofType: "mp3")
        //ubah alamat jadi url
        let url = URL(fileURLWithPath: alamat!)
        
        do{
            player8 = try AVAudioPlayer(contentsOf: url)
            player8?.play()
        }catch{
            
        }
    }
    
    func PlayStep(){
        //alamat file audionya
        let alamat = Bundle.main.path(forResource: "klikNomor", ofType: "mp3")
        //ubah alamat jadi url
        let url = URL(fileURLWithPath: alamat!)
        
        do{
            player9 = try AVAudioPlayer(contentsOf: url)
            player9?.play()
        }catch{
            
        }
    }
    
}
