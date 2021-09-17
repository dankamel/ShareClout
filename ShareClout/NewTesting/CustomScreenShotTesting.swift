//
//  CustomScreenShotTesting.swift
//  ShareClout
//
//  Created by Daniel Kamel on 01/09/2021.
//

import SwiftUI
import IGStoryKit

struct CustomScreenShotTesting: View {
    
    @State private var shouldCaptureScreenshot = false
    
    var body: some View {
        
        ZStack {
            
            NewDesignScreen()
            GeometryReader { (geometry) in
                VStack {
                    Clout()
                    Spacer()
                    Spacer()
                }
                .onChange(of: shouldCaptureScreenshot) { newValue in
                    if (newValue) {
                        
                        let screenshot = self.takeScreenshot(origin: geometry.frame(in: .global).origin, size: geometry.size)
                    print(screenshot)
                    shouldCaptureScreenshot = true
                        
                    let igData9 = IGData(backgroundType: .gradient, colorTop: .red, colorBottom: .blue, backgroundImage: nil, contentSticker: screenshot!)
                        
                        let igDispatcher4 = IGDispatcher(igData: igData9)
                        
                        igDispatcher4.start()
                        

                        
                    }
                }
            }
            .frame(maxWidth: 300, maxHeight: 300)
            
            Button(action: {
                
                self.shouldCaptureScreenshot = true
                

                
            }, label:{Text("press me to screenshot")}).padding(.bottom, 500)
            
            
        }
    }
}

struct CustomScreenShotTesting_Previews: PreviewProvider {
    static var previews: some View {
        CustomScreenShotTesting()
    }
}
