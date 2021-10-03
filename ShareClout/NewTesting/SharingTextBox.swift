////
////  SharingTextBox.swift
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
//    func extraSnapshot() -> UIImage {
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
//struct SharingTextBox: View {
//
//    var newView: some View {
//
//        Clout()
//
//    }
//
//    var body: some View {
//
//        Button(action: {
//
//            let image = newView.extraSnapshot()
//
//            let igNewData = IGData(backgroundType: .gradient, colorTop: .red, colorBottom: .blue, backgroundImage: .none, contentSticker: image)
//
//            let igNewDispatcher = IGDispatcher (igData: igNewData)
//
//            igNewDispatcher.start()
//
//
//        }, label:{Text("share to insta")})
//
//
//    }
//}
//
//struct SharingTextBox_Previews: PreviewProvider {
//    static var previews: some View {
//        SharingTextBox()
//    }
//}
