////
////  Alternative to caching.swift
////  ShareClout
////
////  Created by Daniel Kamel on 01/09/2021.
////
//
//import SwiftUI
//
//struct ViewDidLoadModifier: ViewModifier {
//
//    @State private var didLoad = false
//    private let action: (() -> Void)?
//
//    init(perform action: (() -> Void)? = nil) {
//        self.action = action
//    }
//
//    func body(content: Content) -> some View {
//        content.onAppear {
//            if didLoad == false {
//                didLoad = true
//                action?()
//            }
//        }
//    }
//
//}
//
//extension View {
//
//    func onLoad(perform action: (() -> Void)? = nil) -> some View {
//        modifier(ViewDidLoadModifier(perform: action))
//    }
//
//}
//
//extension View {
//    func TestingSnapshot() -> UIImage {
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
//struct Alternative_to_caching: View {
//
//    @State var clout = Cloutington()
//
//    var testingMe: some View {
//
//        Clout()
//
//    }
//
//    var body: some View {
//        
//        VStack {
//            Text(clout.postFound?.body ?? "n/a")
//        }
//        .onAppear() {
//
//            fetchResults().getData { (clout) in
//
//                self.clout = clout
//            }
//
//        }
//        .onLoad() {
//
//            let easyImage = testingMe.TestingSnapshot()
//            print(easyImage)
//        }
//    }
//}
//
//struct Alternative_to_caching_Previews: PreviewProvider {
//    static var previews: some View {
//        Alternative_to_caching()
//    }
//}
