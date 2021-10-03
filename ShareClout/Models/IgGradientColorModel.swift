//
//  IgGradientColorModel.swift
//  ShareClout
//
//  Created by Daniel Kamel on 20/09/2021.
//

import SwiftUI
import Foundation

class IgGradientColorModel: ObservableObject {
    
    @Published var colorTopLiteral: UIColor = .red
    @Published var colorBottomLiteral: UIColor = .blue
    
}
