//
//  GradientRectangleP_B_G.swift
//  ShareClout
//
//  Created by Daniel Kamel on 22/07/2021.
//

import SwiftUI

struct GradientRectangleP_B_G: View {
    var body: some View {
        Rectangle()
            .fill(LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.980392158, green: 0.5450980663, blue: 1, alpha: 1)), location: 0.12205151468515396),
                    .init(color: Color(#colorLiteral(red: 0.16862745583057404, green: 0.8235294222831726, blue: 1, alpha: 1)), location: 0.6509960293769836),
                    .init(color: Color(#colorLiteral(red: 0.1686274558, green: 1, blue: 0.5333333611, alpha: 1)), location: 0.9374207854270935)]),
                        startPoint: UnitPoint(x: 0.03363914297252368, y: 0.03874999944942786),
                        endPoint: UnitPoint(x: 0.9510702651471804, y: 1.0224999711485605)))
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:40, x:0, y:20)
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:40, x:0, y:20)
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 0.5).fill(Color.white))
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.3), radius: 10, x: 0, y:10)
            .padding(.horizontal, 30)
            .padding(.top, 30)
            .frame(maxHeight: 800)
    }
}

struct GradientRectangleP_B_G_Previews: PreviewProvider {
    static var previews: some View {
        GradientRectangleP_B_G()
    }
}
