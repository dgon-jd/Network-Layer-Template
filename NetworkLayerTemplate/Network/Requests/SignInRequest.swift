//
//  SignInRequest.swift
//  NetworkLayerTemplate
//
//  Created by Dmitry Goncharenko on 8/18/16.
//  Copyright © 2016 DGon. All rights reserved.
//

import Foundation

final class SignInRequest: BackendApiRequest {
    
    private let email: String
    private let password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    var endpoint: String {
        return "users/sign_in"
    }
    
    var method: NetworkService.Method {
        return .POST
    }
    
    var parameters: [String : AnyObject]? {
        return ["email" : self.email,
                "password" : self.password]
    }
    
    var headers: [String : String]? {
        return defaultJSONHeaders()
    }
}