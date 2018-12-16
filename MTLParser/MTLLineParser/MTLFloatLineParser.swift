//
//  MTLFloatLineParser.swift
//  MTLParser
//
//  Created by Antoine Clop on 12/16/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class MTLFloatLineParser: MTLLineParser {
    
    private let min: Float?
    private let max: Float?
    
    public init(from line: String, min: Float? = nil, max: Float? = nil) {
        self.min = min
        self.max = max
        super.init(from: line)
    }
    
    override func parse() -> Any? {
        guard self.argumentNumberCheck(2) else { return nil }
        if let floatValue = Float(self.lineSplitted[1]) {
            return floatValue.boundedValue(min: self.min ?? floatValue, max: self.max ?? floatValue)
        }
        else {
            return nil
        }
    }
}
