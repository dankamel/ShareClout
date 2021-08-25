////
////  Testing3.swift
////  ShareClout
////
////  Created by Daniel Kamel on 25/08/2021.
////
//
//import SwiftUI
//
//extension View {
//
//    func snapshot() -> UIImage {
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
//struct Testing3: View {
//
//    var cloutView: some View {
//
//        Clout()
//
//    }
//
//    var body: some View {
//
//        VStack{
//
//            cloutView
//
//            Button("Save to image") {
//
//                let image = cloutView.snapshot()
//
//                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
//
//            }
//
//        }
//
//
//    }
//}
//
//struct Testing3_Previews: PreviewProvider {
//    static var previews: some View {
//        Testing3()
//    }
//}
