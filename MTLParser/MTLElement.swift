//
//  MTLElement.swift
//  MTLParser
//
//  Created by Antoine Clop on 12/16/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation
import UIKit

public class MTLElement {
    
    public var name: String
    public var ambiant: UIColor?
    public var diffuse: UIColor?
    public var specular: UIColor?
    public var emissive: UIColor?
    public var density: Float?
    public var specularExponent: Float?
    public var transparency: Float?
    public var illumination: Int?
    public var ambiantTextureFile: String?
    public var diffuseTextureFile: String?
    public var specularTextureFile: String?
    
    public init(name: String, ambiant: UIColor? = nil, diffuse: UIColor? = nil, specular: UIColor? = nil, emissive: UIColor? = nil, density: Float? = nil, specularExponent: Float? = nil, transparency: Float? = nil, illumination: Int? = nil, ambiantTextureFile: String? = nil, diffuseTextureFile: String? = nil, specularTextureFile: String? = nil) {
        self.name = name
        self.ambiant = ambiant
        self.diffuse = diffuse
        self.specular = specular
        self.emissive = emissive
        self.density = density
        self.specularExponent = specularExponent
        self.transparency = transparency
        self.illumination = illumination
        self.ambiantTextureFile = ambiantTextureFile
        self.diffuseTextureFile = diffuseTextureFile
        self.specularTextureFile = specularTextureFile
    }
    
    public init?(from groupedLines: [String]) {
        var nameValue: String?
        for line in groupedLines {
            let lineParser: MTLLineParser = MTLLineParser.getMTLLineParser(for: line)
            let valueParsed: Any? = lineParser.parse()
            let lineTitle: MTLTitles = MTLLineParser.getLineMTLTitle(line)
            switch lineTitle {
            case .newmtl:
                nameValue = valueParsed as? String
            case .ka:
                self.ambiant = valueParsed as? UIColor
            case .kd:
                self.diffuse = valueParsed as? UIColor
            case .ks:
                self.specular = valueParsed as? UIColor
            case .ke:
                self.emissive = valueParsed as? UIColor
            case .ni:
                self.density = valueParsed as? Float
            case .ns:
                self.specularExponent = valueParsed as? Float
            case .d:
                self.transparency = valueParsed as? Float
            case .illum:
                self.illumination = valueParsed as? Int
            case .map_ka:
                self.ambiantTextureFile = valueParsed as? String
            case .map_kd:
                self.diffuseTextureFile = valueParsed as? String
            case .map_ks:
                self.specularTextureFile = valueParsed as? String
            default:
                continue
            }
        }
        if let nameValue = nameValue {
            self.name = nameValue
        }
        else {
            return nil
        }
    }
}
