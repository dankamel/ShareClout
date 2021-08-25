//
//  Username.swift
//  ShareClout
//
//  Created by Daniel Kamel on 23/08/2021.
// Unfortantely this isn't being used because can't get the ZStack to adapt to length of Clout

import SwiftUI
import SwiftUIX

struct Username: View {
    
    @State var clout = Cloutington()
    
    var body: some View {
        VStack {
            VisualEffectBlurView(blurStyle: .light, content: {
                HStack {
                    Text("@")
                        .fontWeight(.semibold)
                        .font(.system(size: 15))
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    Text(clout.postFound?.profileEntryResponse?.username ?? "n/a")
                        .fontWeight(.semibold)
                        .font(.system(size: 15))
                        //                            .padding(.leading, 5)
                        .padding(.leading, -9)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                    if clout.postFound?.profileEntryResponse?.isVerified == true {
                        
                        Image(systemName: "checkmark.seal.fill")
                            .font(.system(size: 12))
                            .padding(.trailing, 5)
                            .padding(.leading, -7)
                        
                    }
                    
                }
                
            })
            .frame(width: 150, height: 50)
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            
            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 0.5).fill(Color.white))
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y:10)
            
        }
        .padding(.top, 250)
        .padding(.leading, 200)
        .onAppear() {
            
            fetchResults().getData { (clout) in
                
                self.clout = clout
            }

            
            
        }
    }
}

struct Username_Previews: PreviewProvider {
    static var previews: some View {
        Username()
    }
}
