//
//  MTLTitles.swift
//  MTLParser
//
//  Created by Antoine Clop on 12/16/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

// Some other title exist, but are not handled here: https://www.fileformat.info/format/material/index.htm
internal enum MTLTitles: String {
    case newmtl
    case ka
    case kd
    case ks
    case ke
    case ni
    case ns
    case d
    case illum
    case map_kd
    case map_ks
    case map_ka
    
    case emptyline
    case unknown
}
