//
//  AccountView.swift
//  ExampleSwiftUI
//
//  Created by Ravikanth Thummala on 8/24/23.
//

import SwiftUI


struct AccountRow: View {
    let account: Account
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(account.accountNickName)
                .font(.headline)
            Text(account.acountBalance)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("Is External: \(account.isExternal.description)")
                .font(.caption)
                .foregroundColor(account.isExternal ? .green : .red)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountRow(account: Account(accountId: "asefdasdfasd-asdfasdf-asdf", accountNickName: "BOFA 1234", acountBalance: "$123,456,789.00", type: "DDA", isExt: "N", lastUpdated: "08/18/2023"))
    }
}
