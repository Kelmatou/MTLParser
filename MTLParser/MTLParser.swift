//
//  MTLParser.swift
//  MTLParser
//
//  Created by Antoine Clop on 12/16/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class MTLParser {
    
    public static func parse(contentOf file: URL) -> [MTLElement] {
        let fileLines: [String] = MTLParser.extractContent(of: file)
        return MTLParser.parseMTLContent(fileLines)
    }
    
    private static func parseMTLContent(_ content: [String]) -> [MTLElement] {
        var mtlElements: [MTLElement] = []
        let groupedMaterialLines: [[String]] = MTLParser.groupMaterialLines(content)
        for materialLines in groupedMaterialLines {
            if let newMtlElement = MTLElement(from: materialLines) {
                mtlElements.append(newMtlElement)
            }
        }
        return mtlElements
    }
    
    private static func groupMaterialLines(_ content: [String]) -> [[String]] {
        var groupedMaterialLines: [[String]] = []
        var currentGroup: [String] = []
        for line in content {
            let lineMTLTitle: MTLTitles = MTLLineParser.getLineMTLTitle(line)
            if lineMTLTitle == .newmtl {
                if !currentGroup.isEmpty {
                    groupedMaterialLines.append(currentGroup)
                }
                currentGroup = [line]
            }
            else if lineMTLTitle != .emptyline && lineMTLTitle != .unknown {
                currentGroup.append(line)
            }
        }
        if !currentGroup.isEmpty {
            groupedMaterialLines.append(currentGroup)
        }
        return groupedMaterialLines
    }
    
    private static func extractContent(of file: URL) -> [String] {
        do {
            let fileContent: String = try String(contentsOf: file, encoding: .ascii)
            return fileContent.components(separatedBy: .newlines)
        }
        catch {
            print("MTLParser: error reading content of \(file.absoluteString): \(error)")
            return []
        }
    }
}
