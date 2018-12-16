//
//  IntExtension.swift
//  MTLParser
//
//  Created by Antoine Clop on 12/16/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

extension Int {
    
    public func boundedValue(min: Int, max: Int) -> Int {
        if self < min {
            return min
        }
        else if self > max {
            return max
        }
        return self
    }
}
