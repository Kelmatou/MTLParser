//
//  MTLLineParser.swift
//  MTLParser
//
//  Created by Antoine Clop on 12/16/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

internal class MTLLineParser {
    
    public let line: String
    public let lineSplitted: [Substring]
    
    public init(from line: String) {
        self.line = line
        self.lineSplitted = line.split(separator: " ")
    }
    
    public func parse() -> Any? {
        return nil
    }
    
    internal func argumentNumberCheck(_ expectedValue: Int) -> Bool {
        if self.lineSplitted.count == expectedValue {
            return true
        }
        else {
            print("\(self): Invalid number of argument exception. Expecting \(expectedValue) argument(s) on line \"\(line)\"")
            return false
        }
    }
    
    public static func getMTLLineParser(for line: String) -> MTLLineParser {
        let title: MTLTitles = MTLLineParser.getLineMTLTitle(line)
        switch title {
        case .newmtl, .map_kd, .map_ks, .map_ka:
            return MTLStringLineParser(from: line)
        case .ka, .kd, .ks, .ke:
            return MTLColorLineParser(from: line)
        case .ni, .d:
            return MTLFloatLineParser(from: line, min: 0, max: 1)
        case .ns:
            return MTLFloatLineParser(from: line, min: 0, max: 100)
        case .illum:
            return MTLIntLineParser(from: line, min: 0, max: 10)
        default:
            return MTLLineParser(from: line)
        }
    }
    
    public static func getLineMTLTitle(_ line: String) -> MTLTitles {
        let firstWord: String? = line.split(separator: " ").first?.lowercased()
        switch firstWord {
        case nil:
            return .emptyline
        case MTLTitles.newmtl.rawValue:
            return .newmtl
        case MTLTitles.ka.rawValue:
            return .ka
        case MTLTitles.kd.rawValue:
            return .kd
        case MTLTitles.ks.rawValue:
            return .ks
        case MTLTitles.ke.rawValue:
            return .ke
        case MTLTitles.ni.rawValue:
            return .ni
        case MTLTitles.ns.rawValue:
            return .ns
        case MTLTitles.d.rawValue:
            return .d
        case MTLTitles.illum.rawValue:
            return .illum
        case MTLTitles.map_kd.rawValue:
            return .map_kd
        case MTLTitles.map_ks.rawValue:
            return .map_ks
        case MTLTitles.map_ka.rawValue:
            return .map_ka
        default:
            return .unknown
        }
    }
}
