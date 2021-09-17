//////
//////  TestingDispatchGroup.swift
//////  ShareClout
//////
//////  Created by Daniel Kamel on 02/09/2021.
//////
////
//import SwiftUI
//import Foundation
//
//extension View {
//    
//    func new2ExtraSnapshot() -> UIImage {
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
//
//
//struct TestingDispatchGroup: View {
//    
//    @State var clout = Cloutington()
//    @State var cloutPrice = Exchange()
//    
//    var BavliLa: some View {
//        
//        Clout()
//        
//    }
//    
//    var body: some View {
//        
//        VStack {
//            
//            
//            Clout(clout: Cloutington(), cloutPrice: Exchange(), userProfilePic: GetProfilePic())
//            
//            Button(action: {
//                
//                let newNewImage = BavliLa.snapshot()
//                UIImageWriteToSavedPhotosAlbum(newNewImage, nil, nil, nil)
//                
//                
//                
//            }, label:{Text("save to camera roll")})
//            
//            
//        }        .onAppear() {
//            
//            fetchResults().getData { (clout) in
//                
//                self.clout = clout
//            }
//            
//            GetExchangeRate().loadData { (cloutPrice) in
//                
//                self.cloutPrice = cloutPrice
//                
//            }
//            
//        }
//    }
//    
//    
//    struct TestingDispatchGroup_Previews: PreviewProvider {
//        static var previews: some View {
//            TestingDispatchGroup()
//        }
//    }
//}
