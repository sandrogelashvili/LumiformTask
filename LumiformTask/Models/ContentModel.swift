//
//  ContentModel.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

import Foundation

struct ContentModel: Decodable {
    let type: ItemType
    let title: String
    var items: [ContentModel]?
    let src: String?
    
    enum ItemType: String, Decodable {
        case page
        case section
        case text
        case image
    }
}
