//
//  Username.swift
//  ShareClout
//
//  Created by Daniel Kamel on 23/08/2021.
// Unfortantely this isn't being used because can't get the ZStack to adapt to length of Clout

import SwiftUI
import SwiftUIX

struct Username: View {
    
    @StateObject var fetch = fetchResults()
    
    var body: some View {
        
        Group {
            
            if fetch.dataHasLoaded {
                
                VStack {
                    VisualEffectBlurView(blurStyle: .light, content: {
                        HStack {
                            Text("@")
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .font(.system(size: 15))
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            Text(fetch.clout.postFound?.profileEntryResponse?.username ?? "n/a")
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .font(.system(size: 15))
                                //                            .padding(.leading, 5)
                                .padding(.leading, -9)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            
                            if fetch.clout.postFound?.profileEntryResponse?.isVerified == true {
                                
                                Image(systemName: "checkmark.seal.fill")
                                    .foregroundColor(.black)
                                    .font(.system(size: 12))
                                    .padding(.trailing, 5)
                                    .padding(.leading, -7)
                                
                            }
                            
                        }
                        
                    })
                    .frame(width: 100, height: 50)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    
                    .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 0.5).fill(Color.white))
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y:10)
                    
                }
                .padding(.top, 250)
                .padding(.leading, 200)
                
            } else {
                
                ProgressView()
                
            }
            
        }
        
        
    }
}

struct Username_Previews: PreviewProvider {
    static var previews: some View {
        Username()
    }
}
