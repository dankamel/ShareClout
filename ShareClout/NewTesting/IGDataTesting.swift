//
//  IGDataTesting.swift
//  ShareClout
//
//  Created by Daniel Kamel on 20/09/2021.
//

import SwiftUI
import  IGStoryKit

class ColorSetting: ObservableObject {
    
    @Published var colorTopLiteralTest: UIColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    @Published var colorBottomLiteralTest: UIColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
    
}

struct IGDataTesting: View {
    
    @EnvironmentObject var colorSetting: ColorSetting
    
    var on = true
    
    var body: some View {
        
        VStack{
            
            Button(action: {
                //fix to a fata error here https://www.hackingwithswift.com/forums/swiftui/fatal-error-no-observableobject-of-type-order-found/3208
                colorSetting.colorTopLiteralTest = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                
            }, label:{Text("press me to change top gradient color to black")})
            
        }
        
    }
}

struct IGDataTesting2: View {
    
    @EnvironmentObject var colorSetting: ColorSetting
    
    var body: some View{
        
        Button(action: {
            
            let IgData1 = IGData(backgroundType: .gradient, colorTop: colorSetting.colorTopLiteralTest, colorBottom: colorSetting.colorBottomLiteralTest, backgroundImage: nil, contentSticker: UIImage(imageLiteralResourceName: "ProfilePic"))
            let IgDispatcher1 = IGDispatcher(igData: IgData1)
            IgDispatcher1.start()
            
            
        }, label:{Text("press me to share to insta")})
        
    }
    
}

struct fakeContentView: View {
    
    @State var selected = 0
    
    var body: some View {
        
        TabView(selection: $selected) {
            
            IGDataTesting().tabItem {Text("View1")}.tag(1)
            IGDataTesting2().tabItem {Text("View2")}.tag(2)
            
        }
        
    }
    
}

struct IGDataTesting_Previews: PreviewProvider {
    static var previews: some View {
        IGDataTesting()
    }
}
