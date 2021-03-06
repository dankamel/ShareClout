//
//  ShareCloutApp.swift
//  ShareClout
//
//  Created by Daniel Kamel on 22/07/2021.
//

import SwiftUI

@main
struct ShareCloutApp: App {
    
//    @StateObject private var colorSetting = ColorSetting()
    
    @StateObject private var igGradientColorModel = IgGradientColorModel()
    @StateObject private var cloutHashHex = CloutHashHex()
    
    var body: some Scene {
        WindowGroup {


            Home()
                .environmentObject(igGradientColorModel)
                .environmentObject(cloutHashHex)

        }
    }
}
