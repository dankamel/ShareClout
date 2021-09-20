//
//  IgGradientColorModel.swift
//  ShareClout
//
//  Created by Daniel Kamel on 20/09/2021.
//

import SwiftUI
import Foundation

class IgGradientColorModel: ObservableObject {
    
    @Published var colorTopLiteral: UIColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    @Published var colorBottomLiteral: UIColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
    
}
