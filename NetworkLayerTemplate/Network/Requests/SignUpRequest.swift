//
//  SignUpRequest.swift
//  NetworkLayerTemplate
//
//  Created by Dmitry Goncharenko on 8/18/16.
//  Copyright © 2016 DGon. All rights reserved.
//

import Foundation

final class SignUpRequest: BackendApiRequest {
    private let user: UserItem
    private let password: String
    
    init(user: UserItem, password: String) {
        self.user = user
        self.password = password
    }
    
    var endpoint: String {
        return "/users"
    }
    
    var method: NetworkService.Method {
        return .POST
    }
    
    var parameters: [String: AnyObject]? {
        var params = [String: AnyObject]()
        params["first_name"] = user.firstName
        params["last_name"] = user.lastName
        params["email"] = user.email
        params["phone_number"] = user.phoneNumber ?? NSNull()
        params["password"] = password
        return params
    }
    
    var headers: [String: String]? {
        return defaultJSONHeaders()
    }

}