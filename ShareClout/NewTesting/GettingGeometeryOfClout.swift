//
//  GettingGeometeryOfClout.swift
//  ShareClout
//
//  Created by Daniel Kamel on 31/08/2021.
//

import SwiftUI

struct GettingGeometeryOfClout: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("VStack size: \(geometry.size.height)") // no need for state var anymore
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .background(Color.green)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: Alignment.topLeading)
            .border(Color.purple, width: 5)
            
        }
    }
}

struct GettingGeometeryOfClout_Previews: PreviewProvider {
    static var previews: some View {
        GettingGeometeryOfClout()
    }
}
