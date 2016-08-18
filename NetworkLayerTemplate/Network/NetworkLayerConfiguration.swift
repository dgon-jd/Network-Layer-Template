//
//  NetworkLayerConfiguration.swift
//  NetworkLayerTemplate
//
//  Created by Dmitry Goncharenko on 8/18/16.
//  Copyright © 2016 DGon. All rights reserved.
//

import Foundation

class NetworkLayerConfiguration {
    
    class func setup() {
        let url = NSURL(string: "some url")!
        let conf = BackendConfiguration(baseURL: url)
        BackendConfiguration.shared = conf
        
        NetworkQueue.shared = NetworkQueue()
    }
}