//
//  DesignButton.swift
//  ShareClout
//
//  Created by Daniel Kamel on 22/07/2021.
//

import SwiftUI

struct DesignButton: View {
    var body: some View {
            
        
        
            HStack{
            
                Text("DESIGN")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color(#colorLiteral(red: 0.7390274405, green: 0.7610722184, blue: 0.9567404389, alpha: 1)))
                Image(systemName: "chevron.right").foregroundColor(Color(#colorLiteral(red: 0.7390274405, green: 0.7610722184, blue: 0.9567404389, alpha: 1)))
                    .font(.system(size: 20, weight: .bold))
                    
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(lineWidth: 3).fill(Color(#colorLiteral(red: 0.7390274405, green: 0.7610722184, blue: 0.9567404389, alpha: 1))))
        
            

    }
}

struct DesignButton_Previews: PreviewProvider {
    static var previews: some View {
        DesignButton()
    }
}
