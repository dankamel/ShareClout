//
//  CloutTextField.swift
//  ShareClout
//
//  Created by Daniel Kamel on 22/07/2021.
//

import SwiftUI

struct CloutTextField: View {
    
    @State var textFieldText: String = ""
    @State var isValidBitCloutURL = false
    
    var body: some View {
        
        TextField("Clout URL", text: $textFieldText)
            .font(.title2)
            .foregroundColor(Color(#colorLiteral(red: 0.5861073732, green: 0.6053201556, blue: 0.7488281727, alpha: 1)))
            .padding()
            .background(Color(#colorLiteral(red: 0.7390274405, green: 0.7610722184, blue: 0.9567404389, alpha: 1)))
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 0.5).fill(Color.white))
            .shadow(color: Color(#colorLiteral(red: 0.2241683006, green: 0.2581242323, blue: 0.6071507931, alpha: 1)).opacity(0.3), radius: 10, x: 0, y:10)
            .padding(.horizontal, 30)
            .padding(.top, 150)
            .onChange(of: textFieldText) { (value) in
                
                if value.contains("/posts") {
                    
                    isValidBitCloutURL = true
                    
                } else {
                    
                    isValidBitCloutURL = false
                    
                }
                
            }
        
        if isValidBitCloutURL {
                    DesignButton()
                }
        
        
       
        
        
    }
}

struct CloutTextField_Previews: PreviewProvider {
    static var previews: some View {
        CloutTextField()
    }
}

