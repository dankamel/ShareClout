//
//  TestingImages.swift
//  ShareClout
//
//  Created by Daniel Kamel on 13/08/2021.
//

import SwiftUI

extension String {
    
    func NewLoad() -> UIImage {
        
        do {
            
            guard let url = URL(string: self) else {
                
                return UIImage()
                
            }
            
            let data: Data = try Data(contentsOf: url)
            
            return UIImage(data: data) ?? UIImage()
        } catch {
            
        }
        
        return UIImage()
        
    }
    
}

struct TestingImages: View {
    
    @State var clout = Cloutington()
    
    
//    func pubby () -> String() {
//
//
//    }
//
//    var PublicKey = pubby.self
    
    var body: some View {
        Image(uiImage: "https://bitclout.com/api/v0/get-single-profile-picture/\(clout.postFound?.posterPublicKeyBase58Check)".NewLoad())
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxHeight: 50)
            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.3), radius: 10, x: 0, y:10)
            .padding(.leading, 30)
            .onAppear() {
                
                fetchResults().getData { (clout) in
                    
                    self.clout = clout
                }
                
            }
            
    }
}

struct TestingImages_Previews: PreviewProvider {
    static var previews: some View {
        TestingImages()
    }
}

