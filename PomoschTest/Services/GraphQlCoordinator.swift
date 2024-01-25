//
//  GraphQlCoordinator.swift
//  PomoschTest
//
//  Created by Georgy on 23.01.2024.
//

import Foundation
import UIKit
import Apollo

class DataCoordinator: NSObject {

    // MARK: Variables
    static let identifier: String = "[DataCoordinator]"
    static let shared: DataCoordinator = DataCoordinator()
    var apolloClient: ApolloClient?

    // MARK: Lifecycle
    func initialize() {
        if let baseUrl = baseURL {
           
            self.apolloClient = ApolloClient(url: baseUrl)
            print("Successfully initialized the Apollo Client.")
        
            self.makeIdsGraphQLCall()
        } else {
        print("Failed to initialize the Apollo Client.")
        }
    }
}
