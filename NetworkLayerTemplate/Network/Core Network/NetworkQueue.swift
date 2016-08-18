//
//  NetworkQueue.swift
//  NetworkLayerTemplate
//
//  Created by Dmitry Goncharenko on 8/18/16.
//  Copyright © 2016 DGon. All rights reserved.
//

import Foundation

public class NetworkQueue {
    public static var shared: NetworkQueue!
    
    let queue = NSOperationQueue()
    
    public init() {}
    
    public func addOperation(operation: NSOperation) {
        queue.addOperation(operation)
    }
}