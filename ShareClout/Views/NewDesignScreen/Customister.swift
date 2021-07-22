//
//  Customister.swift
//  ShareClout
//
//  Created by Daniel Kamel on 22/07/2021.
//

import SwiftUI

struct Customiser: View {
    var body: some View {
        
        Rectangle()
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 0.5).fill(Color.white))
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.3), radius: 10, x: 0, y:10)
            .padding(.horizontal, 30)
            .frame(maxHeight: 200)
            .foregroundColor(Color(#colorLiteral(red: 0.7390274405, green: 0.7610722184, blue: 0.9567404389, alpha: 1)))
    }
}

struct Customiser_Previews: PreviewProvider {
    static var previews: some View {
        Customiser()
    }
}
