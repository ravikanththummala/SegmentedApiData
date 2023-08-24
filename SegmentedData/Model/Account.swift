//
//  ItemModel.swift
//  ExampleSwiftUI
//
//  Created by Ravikanth Thummala on 8/24/23.
//

import Foundation

struct Account: Codable, Identifiable {
    let id = UUID()
    let accountId: String
    let accountNickName: String
    let acountBalance: String
    let type: String
    let isExt: String
    let lastUpdated: String
    
    var isExternal: Bool {
        return isExt.uppercased() == "Y"
    }
}

struct AccountListResponse: Codable {
    let accountList: [Account]
}
