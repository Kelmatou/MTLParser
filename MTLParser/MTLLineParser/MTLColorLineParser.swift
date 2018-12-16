//
//  MTLColorLineParser.swift
//  MTLParser
//
//  Created by Antoine Clop on 12/16/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation
import UIKit

internal class MTLColorLineParser: MTLLineParser {
    
    private enum ColorComponents: Int {
        case Red = 1
        case Green = 2
        case Blue = 3
    }
    
    override func parse() -> Any? {
        guard self.argumentNumberCheck(4) else { return nil }
        guard let red = self.getColorComponent(.Red) else { return nil }
        guard let green = self.getColorComponent(.Green) else { return nil }
        guard let blue = self.getColorComponent(.Blue) else { return nil }
        return UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
    }
    
    private func getColorComponent(_ colorComponent: ColorComponents) -> Float? {
        guard let colorValue = Float(self.lineSplitted[colorComponent.rawValue]) else {
            print("\(self): Invalid \(colorComponent) format (\(self.lineSplitted[colorComponent.rawValue]))")
            return nil
        }
        return colorValue.boundedValue(min: 0, max: 1)
    }
}
