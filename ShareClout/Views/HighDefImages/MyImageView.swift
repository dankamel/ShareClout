//
//  MyImageView.swift
//  ShareClout
//
//  Created by Daniel Kamel on 22/07/2021.
// This file is created to fix distorted images in SwiftUI, see here: //https://stackoverflow.com/questions/61164005/why-do-pdfs-resized-in-swiftui-getting-sharp-edges

import SwiftUI

struct MyImageView: UIViewRepresentable {
    var name: String
    var contentMode: UIView.ContentMode = .scaleAspectFit
    var tintColor: UIColor = .black
    
    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        imageView.setContentCompressionResistancePriority(.fittingSizeLevel,
                                                          for: .vertical)
        return imageView
    }
    
    func updateUIView(_ uiView: UIImageView, context: Context) {
        uiView.contentMode = contentMode
        uiView.tintColor = tintColor
        if let image = UIImage(named: name) {
            uiView.image = image
        }
    }
}
