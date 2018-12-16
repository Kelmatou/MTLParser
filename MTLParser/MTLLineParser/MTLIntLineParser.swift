//
//  MTLIntLineParser.swift
//  MTLParser
//
//  Created by Antoine Clop on 12/16/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class MTLIntLineParser: MTLLineParser {
    
    private let min: Int?
    private let max: Int?
    
    public init(from line: String, min: Int? = nil, max: Int? = nil) {
        self.min = min
        self.max = max
        super.init(from: line)
    }
    
    override func parse() -> Any? {
        guard self.argumentNumberCheck(2) else { return nil }
        if let intValue = Int(self.lineSplitted[1]) {
            return intValue.boundedValue(min: self.min ?? intValue, max: self.max ?? intValue)
        }
        else {
            return nil
        }
    }
}
