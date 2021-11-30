//
//  CloutImage.swift
//  ShareClout
//
//  Created by Daniel Kamel on 08/10/2021.
//

import SwiftUI

extension String {
    
    func NewLoad2() -> UIImage {
        
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

struct CloutImage: View {
    
    @StateObject var resultFetcher = ResultFetcher()
    
    var body: some View {
        
        
        //Not sure why this just gives me a blank screen
        Image(uiImage: "\(resultFetcher.clout.postFound?.imageURLs ?? [])".NewLoad2())
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 40)
            .frame(maxHeight: 40)
            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.3), radius: 10, x: 0, y:10)
        
        
    }
    
    
}


struct CloutImage_Previews: PreviewProvider {
    static var previews: some View {
        CloutImage()
    }
}
