//
//  MTLStringLineParser.swift
//  MTLParser
//
//  Created by Antoine Clop on 12/16/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class MTLStringLineParser: MTLLineParser {
    
    override func parse() -> Any? {
        guard self.argumentNumberCheck(2) else { return nil }
        return String(self.lineSplitted[1])
    }
}
