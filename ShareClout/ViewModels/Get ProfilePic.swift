//
//  GetProfilePic.swift
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

struct GetProfilePic: View {
    
    @State var clout = Cloutington()
    
    var body: some View {
        Image(uiImage: "https://bitclout.com/api/v0/get-single-profile-picture/\(clout.postFound?.profileEntryResponse?.publicKeyBase58Check ?? "n/a")".NewLoad())
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 40)
            .frame(maxHeight: 40)
            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.3), radius: 10, x: 0, y:10)
            .padding(.leading, 20)
            .onAppear() {
                
                fetchResults().getData { (clout) in
                    
                    self.clout = clout
                }
                
            }
    }
}




