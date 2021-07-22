//
//  MainRectangle.swift
//  ShareClout
//
//  Created by Daniel Kamel on 22/07/2021.
//

import SwiftUI
import SwiftUIX

struct MainRectangle: View {
    
    @State var textFieldText: String = ""
    @State var isValidBitCloutURL = false
    
    var body: some View {
 
            ZStack {
                
                //MARK: - Glassmorphism
                    VisualEffectBlurView(blurStyle: .light, content: {

                            LinearGradient(
                                        gradient: Gradient(stops: [
                                    .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), location: 0),
                                    .init(color: Color(#colorLiteral(red: 0.3362847567, green: 0.3959184885, blue: 0.878670454, alpha: 1)), location: 1)]),
                                        startPoint: UnitPoint(x: 9.388159638579197e-9, y: 0.0555555508615754),
                                        endPoint: UnitPoint(x: 0.8405172486861134, y: 0.9305555408375922))
            
                                
                                .mask(
                                        //MARK: - Paste your clout
                                    HStack {
                                        Text("Paste \nyour \nclout")
                                            .font(.largeTitle)
                                            .fontWeight(.semibold)
                                            .padding(.leading, 30)
                                            .padding(.bottom, 80)
                                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                        
                                        Spacer()
                                    }

                                )
              
                        

                    })
                    

                      //  MARK: - Clout URL
               // CloutTextField()
                
                 
                
                
                
                
                
                
            }
            .frame(maxWidth: 327, maxHeight: 300)
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 0.5).fill(Color.white))
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y:10)
            .padding()
            
        
    }
    
    
}




struct MainRectangle_Previews: PreviewProvider {
    static var previews: some View {
        MainRectangle()
    }
}
