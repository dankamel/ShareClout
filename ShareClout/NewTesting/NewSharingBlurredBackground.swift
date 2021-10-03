////
////  NewSharingBlurredBackground.swift
////  ShareClout
////
////  Created by Daniel Kamel on 31/08/2021.
////
//
//import SwiftUI
//import IGStoryKit
//
//extension View {
//    
//    func newExtraSnapshot() -> UIImage {
//        let controller = UIHostingController(rootView: self)
//        let view = controller.view
//        
//        let targetSize = controller.view.intrinsicContentSize
//        view?.bounds = CGRect(origin: .zero, size: targetSize)
//        view?.backgroundColor = .clear
//        
//        let renderer = UIGraphicsImageRenderer(size: targetSize)
//        
//        return renderer.image { _ in
//            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
//        }
//    }
//    
//}
//
//struct NewSharingBlurredBackground: View {
//    
//    var iziit: some View {
//        
//        CloutWithBlurredBackground()
//        
//    }
//    
//    var body: some View {
//        
//        Button(action: {
//            
//            let realImage = iziit.newExtraSnapshot()
//            
//            let igData5 = IGData(backgroundType: .gradient, colorTop: .red, colorBottom: .blue, backgroundImage: nil, contentSticker: realImage)
//            
//            let igDispatcher = IGDispatcher(igData: igData5)
//            
//            igDispatcher.start()
//            
//            
//        }, label:{Text("press me")})
//        
//    }
//}
//
//struct NewSharingBlurredBackground_Previews: PreviewProvider {
//    static var previews: some View {
//        NewSharingBlurredBackground()
//    }
//}
