//
//  GraphQlCoordinator + API.swift
//  PomoschTest
//
//  Created by Georgy on 24.01.2024.
//

import Apollo
import PomochAPI
import Foundation

extension DataCoordinator {
    func makeWardsGraphQLCall() {
        
        guard !isFetchingPersons else { return }
        isFetchingPersons = true
        
        guard let apolloClient = self.apolloClient else {
            print("Could not make the call as Apollo Client does not exist.")
            return
        }
        
        let currentPage:GraphQLNullable<String> = GraphQLHelper.graphQLNullableFrom(currentCursor)
        
        apolloClient.fetch(query: GetWardsQuery(first: 10, after: currentPage)) { result in
            switch result {
            case .success(let response):
                
                response.data?.wards?.edges?.forEach{ element in
                    let person = self.convertToPerson(element: element)
                    self.persons.append(person)
                }
                
                NotificationCenter.default
                    .post(
                        name: DataCoordinator.didChangeNotification,
                        object: self,
                        userInfo: ["personsList": self.persons])
                
                self.currentCursor = response.data?.wards?.edges?.last?.cursor
                
                self.isFetchingPersons = false
                
            case .failure(let error):
                print("Failed to retrieve GraphQL Wards Data with error: \(error).")
                
                self.isFetchingPersons = false
            }
        }
    }
}

extension DataCoordinator{
    func convertToPerson(element: GetWardsQuery.Data.Wards.Edge) -> Person{
        let url = URL(string: element.node.publicInformation.photo.url)
        
        let age = calculateAge(with: element.node.publicInformation.dateOfBirth,
                               and: element.node.publicInformation.dateOfDeath)
        
        let gender =  self.convertToGender(with: element.node.publicInformation.gender.rawValue)
        
        return Person(fullName: element.node.publicInformation.name.fullName,
                      age: age,
                      story: element.node.publicInformation.story,
                      gender: gender,
                      city: element.node.publicInformation.city,
                      photoURL: url)
        
    }
}
