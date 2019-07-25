//
//  NSColorExtension.swift
//  Today
//
//  Created by gm on 2019/7/25.
//  Copyright © 2019 GMWorkStudio. All rights reserved.
//

import Cocoa

extension NSColor {
    func accentColor(_ accentColorType: AccentColorType) -> NSColor {
        switch accentColorType {
        case .graphite:
           return #colorLiteral(red: 0.5960312486, green: 0.5961049795, blue: 0.5960062742, alpha: 1)
        case .red:
            return #colorLiteral(red: 0.8796771169, green: 0.2202554047, blue: 0.2417787015, alpha: 1)
        case .orange:
            return #colorLiteral(red: 0.976829946, green: 0.7215282321, blue: 0.1510422826, alpha: 1)
        case .yellow:
            return #colorLiteral(red: 0.976829946, green: 0.7215282321, blue: 0.1510422826, alpha: 1)
        case .green:
            return #colorLiteral(red: 0.3826935887, green: 0.7282084823, blue: 0.2740759254, alpha: 1)
        case .blue:
            return #colorLiteral(red: 0.1853429377, green: 0.4802953601, blue: 1, alpha: 1)
        case .purple:
            return #colorLiteral(red: 0.5826681256, green: 0.2384409308, blue: 0.5862762928, alpha: 1)
        case .pink:
            return #colorLiteral(red: 0.9658088088, green: 0.310759306, blue: 0.6188690066, alpha: 1)
        default:
            return #colorLiteral(red: 0.1853429377, green: 0.4802953601, blue: 1, alpha: 1)
        }
    }
}
