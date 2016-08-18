//
//  BackendConfiguration.swift
//  NetworkLayerTemplate
//
//  Created by Dmitry Goncharenko on 8/18/16.
//  Copyright © 2016 DGon. All rights reserved.
//

import Foundation

public final class BackendConfiguration {
    let baseURL: NSURL
    
    public init(baseURL: NSURL) {
        self.baseURL = baseURL
    }
    
    public static var shared: BackendConfiguration!
}