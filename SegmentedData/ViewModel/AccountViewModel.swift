//
//  ItemViewModel.swift
//  ExampleSwiftUI
//
//  Created by Ravikanth Thummala on 8/24/23.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class AccountViewModel:ObservableObject {
    
    @Published var  accounts:[Account] =  []
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        fetchDetails()
    }
    
    func fetchDetails(){
        
        guard let url = URL(string: "https://api.jsonserve.com/ZPOzV2") else {
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: AccountListResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }) { [weak self] accountReponse in
                self?.accounts = accountReponse.accountList
            }
            .store(in: &cancellables)
    }
    
    var externalAccounts: [Account] {
        return accounts.filter { $0.isExternal }
    }
    
    var internalAccounts: [Account] {
        return accounts.filter { !$0.isExternal }
    }
}
