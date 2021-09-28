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

//            fakeContentView().environmentObject(colorSetting)
            
            Home(textFieldText: "")
                .environmentObject(cloutHashHex)
                .environmentObject(igGradientColorModel)
  
//            StackAnswerTest()
            
            

            
            
                
            
            
        }
    }
}
