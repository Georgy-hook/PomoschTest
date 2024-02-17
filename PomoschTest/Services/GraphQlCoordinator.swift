//
//  GraphQlCoordinator.swift
//  PomoschTest
//
//  Created by Georgy on 23.01.2024.
//

import UIKit
import Apollo
//import PomochAPI

class DataCoordinator: NSObject {
    // MARK: Variables
    
    static let identifier: String = "[DataCoordinator]"
    static let shared: DataCoordinator = DataCoordinator()
    
    var persons: [Person] = []
    
    var currentCursor: String? = nil
    
    static let didChangeNotification = Notification.Name(rawValue: "ListProviderDidChange")
    
    var isFetchingPersons = false
    
    private let dateFormatter = AppDateFormatter.shared
    
    var apolloClient: ApolloClient?
    
    // MARK: Lifecycle
    func initialize() {
        if let baseUrl = baseURL {
            self.apolloClient = ApolloClient(url: baseUrl)
            
            self.makeWardsGraphQLCall()
        } else {
            print("Failed to initialize the Apollo Client.")
        }
    }
}

extension DataCoordinator{
    func convertToGender(with genderString: String) -> Gender{
        let gender = genderString == "MALE" ? Gender.Male: Gender.Female
        return gender
    }
    
    func calculateAge(with dateOfBirth: String, and dateOfDeath: String?) -> Int {
        guard let birthDate = dateFormatter.stringToDate(with: dateOfBirth) else {
            return -1
        }
        
        var deathDate: Date?
        if let dateOfDeath = dateOfDeath {
            guard let death = dateFormatter.stringToDate(with: dateOfDeath) else {
                return -1
            }
            deathDate = death
        }
        
        let calendar = Calendar.current
        let endDate = deathDate ?? Date()
        
        let ageComponents = calendar.dateComponents([.year], from: birthDate, to: endDate)
        
        if let age = ageComponents.year {
            return age
        } else {
            return -1
        }
    }
}
