//
//  MusicDetailVC.swift
//  table_coll_brain4code
//
//  Created by JENIL BHADJA on 06/07/22.
//

import UIKit
import AVFoundation

class MusicDetailVC: UIViewController {
    
    var dictAudioitem : audioItemList?
    var player: AVPlayer?
    var isplay = false
    @IBOutlet weak var btnPlay : UIButton!
    @IBAction func btnClickPlayPause(_ sender : UIButton){
        if isplay{
            isplay = false
            player?.pause()
            btnPlay.setImage(UIImage(named: "ic_play"), for: .normal)
        }else{
            isplay = true
            player?.play()
            btnPlay.setImage(UIImage(named: "ic_pause"), for: .normal)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        let btn1 = UIButton(type: .custom)
        btn1.setImage(UIImage(named: "ic_dropdown"), for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn1.addTarget(self, action: #selector(btnClickDropDown), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn1)
        self.navigationItem.setLeftBarButtonItems([item1], animated: true)
        
        title = "music"
        //        self.navigationController!.navigationBar.titleTextAttributes = [
        //            NSAttributedString.Key.foregroundColor: UIColor.white,
        //            NSAttributedString.Key.font: UIFont(name: "Rubik-Regular", size: 20)!]
        
        
        let btn2 = UIButton(type: .custom)
        btn2.setImage(UIImage(named: "ic_share"), for: .normal)
        btn2.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn2.addTarget(self, action: #selector(btnClickShare), for: .touchUpInside)
        let item2 = UIBarButtonItem(customView: btn2)
        self.navigationItem.setRightBarButtonItems([item2], animated: true)
        
        play(url: NSURL(string: (dictAudioitem?.url)!)!)
    }
    
    func play(url:NSURL) {
        print("playing \(url)")
        do {
            let playerItem = AVPlayerItem(url: url as URL)
            self.player = try AVPlayer(playerItem:playerItem)
            player!.volume = 1.0
            player!.play()
            isplay = true
        } catch let error as NSError {
            self.player = nil
            print(error.localizedDescription)
        } catch {
            print("AVAudioPlayer init failed")
        }
    }
    
    @objc func btnClickDropDown(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @objc func btnClickShare(_ sender: Any) {
        //        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "")as?
        //        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
    
    
}
