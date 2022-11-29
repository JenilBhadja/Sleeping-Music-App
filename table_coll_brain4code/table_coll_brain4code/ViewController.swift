//
//  ViewController.swift
//  table_coll_brain4code
//
//  Created by JENIL BHADJA on 30/06/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var tblMusicView: UITableView!
    var strName : String?
    var arrList = [categories]()
    var player : AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        getMusicData()
    }
    func getMusicData() {
        let url = Bundle.main.url(forResource: "music", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let musicModel = try! JSONDecoder().decode(musicResponseModel.self, from: data)
        arrList = (musicModel.data?.categories)!
        tblMusicView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource,DataPass{
    
    func dataPassing(dictMusic: musicItemDic) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MusicDetailVC") as? MusicDetailVC
        vc?.dictAudioitem = dictMusic.audioItem
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    

    func dataPassing(dictMusic: audioItemList) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MusicDetailVC")as? MusicDetailVC
        vc?.dictAudioitem = dictMusic
        
        if let player = player, player.isPlaying{
            player.stop()
        }else{
            let urlString = Bundle.main.path(forResource: "url" , ofType: "mp3")
            
            do{
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                    
                guard let urlString = urlString else {
                    return
                }
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                guard let player = player else{
                    return
                }
                player.play()
            }catch{
                print("somthing went to wrong")
            }
        }
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        let dict = arrList[indexPath.row]
        cell.tblMusiclbl.text = dict.name
        cell.delegate = self
        cell.selectionStyle = .none
        cell.getMusicItem(arrMusicItem: dict.musicItem!)
        //cell.imgName.image = UIImage(named:dict["imagename"] as! String )
        return cell
    }
    
}
