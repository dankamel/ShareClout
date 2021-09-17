//
//  TestingInitialized.swift
//  ShareClout
//
//  Created by Daniel Kamel on 05/09/2021.
//

import SwiftUI

struct TestingInitialized: View {
    
    let clouts: Cloutington
    @State var name: String
    
    var body: some View {
        Text(name)
    }
    
    init(clouts: Cloutington) {
        self.clouts = clouts
        _name = State(initialValue: clouts.postFound?.body ?? "n/a")
    }
    
}

