//
//  Home.swift
//  ShareClout
//
//  Created by Daniel Kamel on 22/07/2021.
//

import SwiftUI
import SwiftUIX

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


struct Home: View {
    
    @State var textFieldText: String = ""
    @State var isValidBitCloutURL = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                Background()
                
                VStack{
                    
                    ZStack {
                        MainRectangle().padding(.bottom, 100)

                        ZStack {
                            TextField("Clout URL", text: $textFieldText)
                                .keyboardType(.URL)
                                .font(.title2)
                                .padding()
                                .foregroundColor(Color(#colorLiteral(red: 0.5861073732, green: 0.6053201556, blue: 0.7488281727, alpha: 1)))
                                .background(Color(#colorLiteral(red: 0.7390274405, green: 0.7610722184, blue: 0.9567404389, alpha: 1)))
                                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 0.5).fill(Color.white))
                                .shadow(color: Color(#colorLiteral(red: 0.2241683006, green: 0.2581242323, blue: 0.6071507931, alpha: 1)).opacity(0.3), radius: 10, x: 0, y:10)
                                .padding(.top, 55)
                                
                                .onChange(of: textFieldText) { (value) in
                                    if value.contains("/posts") {
                                        isValidBitCloutURL = true
                                    } else {
                                        isValidBitCloutURL = false
                                    }
                                    
                            }
                        }.frame(maxWidth: 260)
                    }
                        
                    NavigationLink(
                        destination: NewDesignScreen(), label: {
                            if isValidBitCloutURL {
                                DesignButton()
                            }
                        })
                    
                }.ignoresSafeArea(.keyboard)
                
               
            }
            
        }
       
        
        
        }
        
        
        
    }




struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

