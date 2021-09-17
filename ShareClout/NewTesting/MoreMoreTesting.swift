////
////  MoreMoreTesting.swift
////  ShareClout
////
////  Created by Daniel Kamel on 12/09/2021.
////
//
//import SwiftUI
//
////This is the extension from HackingWithSwift
//extension View {
//    func testingSnapshot() -> UIImage {
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
//}
//
//struct MoreMoreTesting: View {
//    
//    @State var clout = Cloutington()
//    
//    @State var cloutPrice = Exchange()
//    
//    
//    var CloutView: some View {
//        
//
//        
//        Clout()
//        
//        init() {
//            
//            fetchResults().getData { (clout) in
//                
//                self.clout = clout
//                
//            }
//            
//            GetExchangeRate().loadData { (cloutPrice) in
//                
//                self.cloutPrice = cloutPrice
//            
//        }
//        
//    }
//    
//    var body: some View {
//        Button(action: {
//            
//            let image = CloutView.TestingSnapshot()
//            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
//            
//        }, label:{Text("press me to save Clout() to camera roll")})
//    }
//}
//
//struct MoreMoreTesting_Previews: PreviewProvider {
//    static var previews: some View {
//        MoreMoreTesting()
//    }
//}
