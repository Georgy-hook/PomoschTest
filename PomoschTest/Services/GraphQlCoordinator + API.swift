//
//  GraphQlCoordinator + API.swift
//  PomoschTest
//
//  Created by Georgy on 24.01.2024.
//

import Apollo
import PomochAPI

extension DataCoordinator {
    func makeIdsGraphQLCall() {
        print(" Making API Call... ")
        guard let apolloClient = self.apolloClient else {
            print(" Could not make call as Apollo Client does not exist.")
            return
        }
        
        apolloClient.fetch(query: WardsIdsQuery()){ result in
            switch result {
            case .success(let response):
                // Please note that we only print the first one to avoid overloading the interface.
                //print(" makePokemonGraphQLCall Retrieved GraphQL Pokemon Data : \(response.data?.wardsIds).")
                print("success")
                
            case .failure(let error):
                print("Failed to retrieve GraphQL Pokemon Data with error : \(error).")
            }
        }
    }
    
    func makeWardsGraphQLCall(first:GraphQLNullable<Int>, after: GraphQLNullable<String>) {
        print("Making API Call for Wards...")
        guard let apolloClient = self.apolloClient else {
            print("Could not make the call as Apollo Client does not exist.")
            return
        }
        
        apolloClient.fetch(query: GetWardsQuery(first: first, after: after)) { result in
            switch result {
            case .success(let response):
                // Please note that we only print the first one to avoid overloading the interface.
                print("Retrieved GraphQL Wards Data: \(response.data?.wards?.edges?.first?.node.publicInformation.name.fullName).")
            case .failure(let error):
                print("Failed to retrieve GraphQL Wards Data with error: \(error).")
            }
        }
    }
}
