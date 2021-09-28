//
//  StateClout.swift
//  ShareClout
//
//  Created by Daniel Kamel on 25/09/2021.
//

import SwiftUI

struct StateClout: View {
    
    @State var stateClout = Clout()
    @StateObject var resultFetcher = ResultFetcher()
    @State var text = ""
    
    var body: some View {
        
        VStack {
            TextField("Paste Clout Hexcode Here", text: $text)
                .font(.title2)
                .padding()
                .onChange(of: text) { text in
                    resultFetcher.updateData(postHashHex: text)
                }
            
            Clout().onAppear() {
                
                resultFetcher.updateData(postHashHex: text)
                
            }

            
            
            
        }
    }
    
    struct StateClout_Previews: PreviewProvider {
        static var previews: some View {
            StateClout()
        }
    }
}
