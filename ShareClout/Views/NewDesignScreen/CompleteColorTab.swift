//
//  CompleteColorTab.swift
//  ShareClout
//
//  Created by Daniel Kamel on 22/07/2021.
//

import SwiftUI

struct CompleteColorTab: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var isGradientRectangleB_RShowing = true
    @State var isGradientRectangleP_B_GShowing = false
    @State var isGradientRectangleG_PShowing = false
    
    @State var didTap1:Bool = true
    @State var didTap2:Bool = false
    @State var didTap3:Bool = false
    
    var body: some View {
        VStack (spacing: 30) {
            
            //MARK: - Card Background
            ZStack {
                
                GradientRectangleB_R()
                
                if isGradientRectangleP_B_GShowing {
                    
                    GradientRectangleP_B_G()
                    
                }
                
                
                if isGradientRectangleG_PShowing {
                    
                    GradientRectangleG_P()
                    
                }
                
                
            }
            
            //MARK: - ColorTab Customiser
            ZStack {
                Customiser()
                
                HStack {
                    Spacer()
                    //                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    //                    Image(systemName: "chevron.left")
                    //                        .foregroundColor(Color(#colorLiteral(red: 0.3814319372, green: 0.3971602917, blue: 0.508882463, alpha: 1)))
                    //                        .font(.system(size: 20, weight: .semibold))
                    //                })
                    Spacer()
                    Spacer()
                    Text("Color")
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                        .foregroundColor(Color(#colorLiteral(red: 0.3814319372, green: 0.3971602917, blue: 0.508882463, alpha: 1)))
                    Spacer()
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color(#colorLiteral(red: 0.3814319372, green: 0.3971602917, blue: 0.508882463, alpha: 1)))
                        .font(.system(size: 20, weight: .semibold))
                    
                    Spacer()
                }.padding(.bottom, 150)
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation(.spring()){
                            isGradientRectangleB_RShowing = true
                            isGradientRectangleP_B_GShowing = false
                            isGradientRectangleG_PShowing = false
                            
                            didTap1 = true
                            didTap2 = false
                            didTap3 = false
                        }
                        
                    }, label: {
                        Image("ColourGradient1")
                            .padding(.all, 5)
                            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 2.0).fill(didTap1 ? Color(#colorLiteral(red: 0.3778246641, green: 0.3981202841, blue: 0.5109930038, alpha: 1)): Color(#colorLiteral(red: 0.7390274405, green: 0.7610722184, blue: 0.9567404389, alpha: 1))))
                        
                        
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                        
                        withAnimation(.spring()){
                            isGradientRectangleP_B_GShowing = true
                            
                            isGradientRectangleG_PShowing = false
                            
                            didTap2 = true
                            didTap1 = false
                            didTap3 = false
                            
                        }
                        
                    }, label: {
                        Image("ColourGradient2")
                            .padding(.all, 5)
                            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 2.0).fill(didTap2 ? Color(#colorLiteral(red: 0.3778246641, green: 0.3981202841, blue: 0.5109930038, alpha: 1)): Color(#colorLiteral(red: 0.7390274405, green: 0.7610722184, blue: 0.9567404389, alpha: 1))))
                        
                        
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation(.spring()){
                            isGradientRectangleG_PShowing = true
                            
                            isGradientRectangleP_B_GShowing = false
                            
                            didTap3 = true
                            didTap2 = false
                            didTap1 = false
                            
                        }
                        
                    }, label: {
                        Image("ColourGradient3")
                            .padding(.all, 5)
                            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 2.0).fill(didTap3 ? Color(#colorLiteral(red: 0.3778246641, green: 0.3981202841, blue: 0.5109930038, alpha: 1)): Color(#colorLiteral(red: 0.7390274405, green: 0.7610722184, blue: 0.9567404389, alpha: 1))))
                    })
                    
                    Spacer()
                }.padding(.bottom, 50)
                
            }
            
            
        }
    }
}

struct CompleteColorTab_Previews: PreviewProvider {
    static var previews: some View {
        CompleteColorTab()
    }
}
