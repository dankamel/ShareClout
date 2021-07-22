//
//  EmptyPattern.swift
//  ShareClout
//
//  Created by Daniel Kamel on 22/07/2021.
//

import SwiftUI

struct EmptyPattern: View {
    var body: some View {
        Image("EmptyPattern")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct EmptyPattern_Previews: PreviewProvider {
    static var previews: some View {
        EmptyPattern()
    }
}
