//
//  TestingDurge.swift
//  ShareClout
//
//  Created by Daniel Kamel on 13/08/2021.
//

import SwiftUI



struct TestingDurge: View {
    
    @State var clout = Cloutington()
    
//    func Losaly() {
//
//        print(clout.postFound?.posterPublicKeyBase58Check ?? "n/a")
//
//    }
    
    var body: some View {
        
        VStack {
            Text(String(clout.postFound?.posterPublicKeyBase58Check ?? "iz it"))
        }.onAppear() {
            
            fetchResults().getData { (clout) in
                
                self.clout = clout
            }
            
        }
        
    }
}

struct TestingDurge_Previews: PreviewProvider {
    static var previews: some View {
        TestingDurge()
    }
}
