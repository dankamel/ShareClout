//
//  StillTesting.swift
//  ShareClout
//
//  Created by Daniel Kamel on 31/08/2021.
//

#if os(iOS)
import SwiftUI

public extension View {
    
    /**
     Take a snapshot of the view.
     
     `TODO` Add support for macOS, watchOS and tvOS.
     */
    func snapshot(origin: CGPoint = .zero, size: CGSize) -> UIImage {
        let window = UIWindow(frame: CGRect(origin: origin, size: size))
        let hosting = UIHostingController(rootView: self)
        hosting.view.frame = window.frame
        window.addSubview(hosting.view)
        window.makeKeyAndVisible()
        return hosting.view.renderedImage
    }
}

private extension UIView {
    
    var renderedImage: UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()!
        layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
#endif

struct StillTesting: View {
    
    var newOne: some View {
        
        Clout()
        
    }
    
    var body: some View {
        Button(action: {
            
            let newScreenshot = newOne.snapshot(origin: CGPoint.zero, size: CGSize.init(width: 500, height: 500))
            print(newScreenshot)
            
        }, label:{Text("press me")})
    }
}

struct StillTesting_Previews: PreviewProvider {
    static var previews: some View {
        StillTesting()
    }
}
