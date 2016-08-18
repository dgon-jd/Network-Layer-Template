//
//  BackendAuth.swift
//  NetworkLayerTemplate
//
//  Created by Dmitry Goncharenko on 8/18/16.
//  Copyright © 2016 DGon. All rights reserved.
//

import Foundation

// TODO: Save to keychain
public final class BackendAuth {
    
    private let key = "BackendAuthToken"
    private let defaults: NSUserDefaults
    
    public static var shared: BackendAuth!
    
    public init(defaults: NSUserDefaults) {
        self.defaults = defaults
    }
    
    public func setToken(token: String) {
        defaults.setValue(token, forKey: key)
    }
    
    public var token: String? {
        return defaults.valueForKey(key) as? String
    }
    
    public func deleteToken() {
        defaults.removeObjectForKey(key)
    }
}