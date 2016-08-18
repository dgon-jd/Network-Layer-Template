//
//  Demo.swift
//  NetworkLayerTemplate
//
//  Created by Dmitry Goncharenko on 8/18/16.
//  Copyright © 2016 DGon. All rights reserved.
//

import Foundation

class Demo {
    class func signUp() {
        let user = UserItem(firstName: "David",
                            lastName: "Gilmour",
                            email: "davidgilmour@gmail.com",
                            phoneNumber: "+33344242424")
        let signUpOp = SignUpOperation(user: user, password: "WishYouWereHere1975")
        signUpOp.success = { userItem in
            print("User is \(userItem.uniqueId)")
        }
        signUpOp.failure = { error in print(error.localizedDescription) }
        NetworkQueue.shared.addOperation(signUpOp)
    }
    
    class func signIn() {
        let signInOp = SignInOperation(email: "davidgilmour@gmail.com", password: "WishYouWereHere1975")
        signInOp.success = { item in
            print("token = \(item.token)")
            print("user id = \(item.uniqueId)")
        }
        
        signInOp.failure = { error in print(error.localizedDescription) }
        NetworkQueue.shared.addOperation(signInOp)
    }
}