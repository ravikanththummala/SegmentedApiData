//
//  LocalDataView.swift
//  SegmentedData
//
//  Created by Ravikanth Thummala on 8/24/23.
//

import SwiftUI

struct LocalDataView: View {
    @State private var accounts: [Account] = []
    
    var body: some View {
        List(accounts) { account in
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
        .onAppear {
            loadData()
        }
    }
    
    private func loadData(){
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decoder = JSONDecoder()
                let response = try decoder.decode(AccountListResponse.self, from: data)
                accounts = response.accountList
            } catch {
                print("Error loading data: \(error)")
            }
        }
    }
}

struct LocalDataView_Previews: PreviewProvider {
    static var previews: some View {
        LocalDataView()
    }
}
