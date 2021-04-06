//
//  ExtractModel.swift
//  DesafioPhi
//
//  Created by Lucas Siqueira on 13/03/21.
//

import Foundation

struct ExtractModel: Codable{
    var items: [Item] = []

}

struct Item: Codable {
    var createdAt: String?
    var id: String?
    var amount: Int?
    var to: String?
    var from: String?
    var description: String?
    var tType: String?
    var bankName: String?
}
