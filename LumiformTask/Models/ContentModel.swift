//
//  ContentModel.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

import Foundation

struct ContentItem: Decodable {
    let type: ItemType
    let title: String
    let items: [ContentItem]?
    let src: String?

    enum ItemType: String, Decodable {
        case page
        case section
        case text
        case image
    }
}
