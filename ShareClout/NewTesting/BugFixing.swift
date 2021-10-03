//
//  BugFixing.swift
//  ShareClout
//
//  Created by Daniel Kamel on 02/10/2021.
//

import SwiftUI

extension View {
    
    func theNew2OfficialSnapshot() -> UIImage {
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

struct BugFixing: View {
    
    var buggyRick: some View {
        
        BugFixing()
        
    }
    
    var body: some View {
        
        Button(action: {
            
            let stupidBug = self.theNew2OfficialSnapshot()
            print(stupidBug)
            
        }, label:{
            
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                .foregroundColor(.black)
                .padding()
            
            
        })
        
    }
    
    
    struct BugFixing_Previews: PreviewProvider {
        static var previews: some View {
            BugFixing()
        }
    }
}
