////
////  SnapShotView.swift
////  ShareClout
////
////  Created by Daniel Kamel on 12/09/2021.
////
//
import SwiftUI
extension View {
    func snapshotFunc() -> UIImage {
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


struct SnapShotView: View {
    
    var resultFetcher = ResultFetcher()
    
    var newCloutView: some View {
        
        Clout(result: resultFetcher)
        
    }
    
    var body: some View {
        VStack{
            
            newCloutView
            
            Button("Save to Image") {
                
                let snapshotImage = newCloutView.snapshotFunc()
                
                UIImageWriteToSavedPhotosAlbum(snapshotImage, nil, nil, nil)
                
            }
        }
    }
}

struct SnapShotView_Previews: PreviewProvider {
    static var previews: some View {
        SnapShotView()
    }
}
