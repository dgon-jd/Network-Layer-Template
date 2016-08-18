//
//  UserItem.swift
//  NetworkLayerTemplate
//
//  Created by Dmitry Goncharenko on 8/18/16.
//  Copyright © 2016 DGon. All rights reserved.
//

import Foundation

public class UserItem: ParsedItem {
    
    // The property is nil when passed for sign in or sign up operations.
    public let uniqueId: String!
    
    public let firstName: String
    public let lastName: String
    public let email: String
    public let phoneNumber: String?
    
    public init(uniqueId: String! = nil, firstName: String, lastName: String,
                email: String, phoneNumber: String?) {
        self.uniqueId = uniqueId
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phoneNumber = phoneNumber
    }
}
