//
//  FloatExtension.swift
//  MTLParser
//
//  Created by Antoine Clop on 12/16/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

extension Float {
    
    public func boundedValue(min: Float, max: Float) -> Float {
        if self < min {
            return min
        }
        else if self > max {
            return max
        }
        return self
    }
}
