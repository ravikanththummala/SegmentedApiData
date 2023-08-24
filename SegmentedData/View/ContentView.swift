//
//  ContentView.swift
//  SegmentedData
//
//  Created by Ravikanth Thummala on 8/24/23.
//

import SwiftUI
struct ContentView: View {
    @ObservedObject private var viewModel = AccountViewModel()
    @State private var selectedSegment = 0
    
    var body: some View {
        VStack {
            Picker("", selection: $selectedSegment) {
                Text("External").tag(0)
                Text("Internal").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            List {
                if selectedSegment == 0 {
                    ForEach(viewModel.externalAccounts) { account in
                        AccountRow(account: account)
                    }
                } else {
                    ForEach(viewModel.internalAccounts) { account in
                        AccountRow(account: account)
                    }
                }
            }
        }.onAppear{
            viewModel.fetchDetails()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

