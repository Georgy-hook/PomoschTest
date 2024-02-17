//
//  GraphQLHelper.swift
//  PomoschTest
//
//  Created by Georgy on 25.01.2024.
//

import Foundation
import PomochAPI

 struct GraphQLHelper {

    init() {}

    static func graphQLNullableFrom<T>(_ value: T?) -> GraphQLNullable<T> {
        if let val = value {
            return .some(val)
        }

        return .none
    }
}
