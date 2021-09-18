//
//  RethinkingClout.swift
//  ShareClout
//
//  Created by Daniel Kamel on 18/09/2021.
//

import SwiftUI

extension View {

    func rethinkSnapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }

}

struct RethinkingClout: View {
    
    @StateObject var fetch = fetchResults()
    
    var body: some View {
        
        Group{
            
            if fetch.dataHasLoaded {
                
                VStack {
                    
                    Clout()
                    
                }.onAppear() {
                    
                    let rethinkImage = self.rethinkSnapshot()
                    print(rethinkImage)
                    
                }
                
            } else {
                
                Text("loading the data la")
                
            }
            
            
            
        }
        
        
    }
}

struct RethinkingClout_Previews: PreviewProvider {
    static var previews: some View {
        RethinkingClout()
    }
}
