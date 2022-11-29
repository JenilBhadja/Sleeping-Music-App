//
//  MyTableViewCell.swift
//  table_coll_brain4code
//
//  Created by JENIL BHADJA on 30/06/22.
//

import UIKit

protocol DataPass{
    func dataPassing(dictMusic:musicItemDic)
}

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet var collView: UICollectionView!
    @IBOutlet var tblMusiclbl: UILabel!
    var delegate : DataPass!
    
    var arrMusicitem = [musicItemDic]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collView.layer.cornerRadius = 10.0
        //        self.collView.layer.borderWidth = 1.0
        //        self.collView.layer.borderColor = UIColor.clear.cgColor
        //        self.collView.layer.masksToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    func getMusicItem(arrMusicItem: [musicItemDic]) {
        arrMusicitem = arrMusicItem
        collView.reloadData()
    }
}

extension MyTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrMusicitem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        let dict = arrMusicitem[indexPath.row]
        cell.collMusiclbl1.text = dict.name
        let secondString = String(format: "%02d", Int(dict.audioTime!) % 60)
        let minutString = String(format: "%02d", Int(dict.audioTime!) / 60)
        cell.collMusiclbl2.text = "\(minutString):\(secondString)"
        //cell.selectionStyle = .none
        //cell.imgName.image = UIImage(named:dict["imagename"] as! String )
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 3), height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.dataPassing(dictMusic: arrMusicitem[indexPath.row])
    }
    
}
