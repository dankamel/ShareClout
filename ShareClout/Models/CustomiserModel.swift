//
//  CustomiserModel.swift
//  ShareClout
//
//  Created by Daniel Kamel on 22/07/2021.
//

import Foundation

struct CustomiserModel : Identifiable {
    
    //var image1-3 are for the buttons to change color or pattern of background
    //custom indicator will be done later
    
    var id: String = UUID().uuidString
    var title: String
    var image1: String
    var image2: String
    var image3: String
}

let Customiser_Data = [

    CustomiserModel(title: "Color", image1: "ColourGradient1" , image2: "ColourGradient2", image3: "ColourGradient3"),
    
    CustomiserModel(title: "Pattern", image1: "BlankColor" , image2: "RepeatingOption", image3: "SmallBitCloutLogo"),
    
    CustomiserModel(title: "Share", image1: "Instagram" , image2: "Twitter", image3: "Download")


]

