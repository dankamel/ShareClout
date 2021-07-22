//
//  CompletePatternTab.swift
//  ShareClout
//
//  Created by Daniel Kamel on 22/07/2021.
//

import SwiftUI

struct CompletePatternTab: View {
    
    @State var isEmptyPatternShowing = true
    @State var isRepeatingBitCloutBackgroundShowing = false
    @State var isBigBitCloutLogoShowing = false
    
    @State var didTap1:Bool = true
    @State var didTap2:Bool = false
    @State var didTap3:Bool = false
    
    var body: some View {
        
        VStack (spacing: 30) {
            
            //MARK: - Pattern Background
            ZStack{
                
                EmptyPattern()
                
                if isRepeatingBitCloutBackgroundShowing{
                    
                    RepeatingBitCloutBackground()
                    
                }
                
                if isBigBitCloutLogoShowing {
                    
                    BigBitCloutLogo()
                    
                }
            }
            
            //MARK: - ColorTab Customiser
            ZStack {
                Customiser()
                
                //MARK: - Pattern and Chevrons
                HStack {
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color(#colorLiteral(red: 0.3814319372, green: 0.3971602917, blue: 0.508882463, alpha: 1)))
                            .font(.system(size: 20, weight: .semibold))
                    })
                    Spacer()
                    Spacer()
                    Text("Pattern")
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
                            
                            isRepeatingBitCloutBackgroundShowing = false
                            isBigBitCloutLogoShowing = false
                            
                            didTap1 = true
                            didTap2 = false
                            didTap3 = false
                        }
                        
                    }, label: {
                        Image("RepeatingOption")
                            .renderingMode(.template)
                            .foregroundColor(Color(#colorLiteral(red: 0.7390274405, green: 0.7610722184, blue: 0.9567404389, alpha: 1)))
                            .padding(.all, 5)
                            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 2.0).fill(didTap1 ? Color(#colorLiteral(red: 0.3778246641, green: 0.3981202841, blue: 0.5109930038, alpha: 1)): Color(#colorLiteral(red: 0.7390274405, green: 0.7610722184, blue: 0.9567404389, alpha: 1))))
                        
                        
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                        
                        withAnimation(.spring()){
                            isRepeatingBitCloutBackgroundShowing = true
                            isBigBitCloutLogoShowing = false
                            
                            didTap2 = true
                            didTap1 = false
                            didTap3 = false
                            
                        }
                        
                    }, label: {
                        MyImageView(name: "RepeatingOption", contentMode: .scaleAspectFit)
                            .frame(width: 40, height: 40)
                            .padding(.all, 5)
                            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 2.0).fill(didTap2 ? Color(#colorLiteral(red: 0.3778246641, green: 0.3981202841, blue: 0.5109930038, alpha: 1)): Color(#colorLiteral(red: 0.7390274405, green: 0.7610722184, blue: 0.9567404389, alpha: 1))))
                        
                        
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation(.spring()){
                            isRepeatingBitCloutBackgroundShowing = false
                            isBigBitCloutLogoShowing = true
                            
                            didTap3 = true
                            didTap2 = false
                            didTap1 = false
                            
                        }
                        
                    }, label: {
                        MyImageView(name: "SmallBitCloutLogo", contentMode: .scaleAspectFit)
                            .frame(width: 40, height: 40)
                            .padding(.all, 5)
                            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 2.0).fill(didTap3 ? Color(#colorLiteral(red: 0.3778246641, green: 0.3981202841, blue: 0.5109930038, alpha: 1)): Color(#colorLiteral(red: 0.7390274405, green: 0.7610722184, blue: 0.9567404389, alpha: 1))))
                    })
                    
                    Spacer()
                    
                    
                }.padding(.bottom, 50)
                
                
            }
            
            
        }
        
      
        
        
        
        
    }
    
}


struct CompletePatternTab_Previews: PreviewProvider {
    static var previews: some View {
        CompletePatternTab()
    }
}
