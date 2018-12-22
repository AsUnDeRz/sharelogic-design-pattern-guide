//
//  RegisterModel.swift
//  Domain
//
//  Created by admin on 19/12/2561 BE.
//  Copyright © 2561 AsUnDeR. All rights reserved.
//

import Foundation

public struct RegisterModel: Codable {
    
    public let city: String
    public let street: String
    public let suite: String
    public let zipcode: String
    
    public init(city: String,
                street: String,
                suite: String,
                zipcode: String) {
        self.city = city
        self.street = street
        self.suite = suite
        self.zipcode = zipcode
    }
}

extension RegisterModel : Equatable {
    public static func == (lhs: RegisterModel, rhs: RegisterModel) -> Bool {
        return lhs.city == rhs.city &&
            lhs.street == rhs.street &&
            lhs.suite == rhs.suite &&
            lhs.zipcode == rhs.zipcode
    }
}
