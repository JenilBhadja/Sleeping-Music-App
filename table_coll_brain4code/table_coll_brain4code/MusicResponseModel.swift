//
//  MusicResponseModel.swift
//  table_coll_brain4code
//
//  Created by JENIL BHADJA on 24/07/22.
//

import Foundation

struct musicResponseModel: Codable {
    var data: categoriesResponse?
}
struct categoriesResponse: Codable {
    var categories :[categories]?
}
struct categories: Codable{
    var id : String?
    var name : String?
    var musicItem :[musicItemDic]?
}

struct musicItemDic: Codable{
    var id : String?
    var name : String?
    var slug : String?
    var bdType : String?
    var bgValue : String?
    var orderId : Int?
    var category : categoryName?
    var audioItem : audioItemList?
    var audioTime : Int?
    var isUnlocked : Bool?
}
 
struct categoryName: Codable{
    var id : String?
    var name : String?
}

struct audioItemList: Codable{
    var id : String?
    var url : String?
    var name : String?
}

