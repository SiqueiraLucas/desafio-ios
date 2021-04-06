//
//  ReceiptModel.swift
//  DesafioPhi
//
//  Created by Lucas Siqueira on 14/03/21.
//

import Foundation

struct ReceiptModel: Codable {
    var amount: Int?
    var id: String?
    var authentication: String?
    var tType: String?
    var createdAt: String?
    var to: String?
    var description: String?
    var bankName: String?
}
