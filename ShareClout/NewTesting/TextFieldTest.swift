//
//  TextFieldTest.swift
//  ShareClout
//
//  Created by Daniel Kamel on 22/09/2021.
//

import SwiftUI

struct TextFieldTest: View {
    
    @EnvironmentObject var cloutHashHex: CloutHashHex
    
    var body: some View {
        TextField("Clout URL", text: $cloutHashHex.postHashHex)
    }
}

struct TextFieldTest_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldTest()
    }
}
