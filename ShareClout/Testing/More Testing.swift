//
//  MoreTesting.swift
//  ShareClout
//
//  Created by Daniel Kamel on 23/08/2021.
//

import SwiftUI
import SwiftUIX

struct MoreTesting : View {
    var body: some View {
        
        ZStack {
            Background().ignoresSafeArea()
            
            ZStack {
                Text("hey there")
                    .padding()
                    .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                
                BlurView(style: .regular)
            }.mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 0.5).fill(Color.white))
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y:10)
            
            
            
        }
        
        
        
    }
}

struct MoreTesting_Previews: PreviewProvider {
    static var previews: some View {
        MoreTesting ()
    }
}

struct BlurView: UIViewRepresentable {
    
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
    
    
}
