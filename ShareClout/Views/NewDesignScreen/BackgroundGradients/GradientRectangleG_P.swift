//
//  GradientRectangleG_P.swift
//  ShareClout
//
//  Created by Daniel Kamel on 22/07/2021.
//

import SwiftUI

struct GradientRectangleG_P: View {
    var body: some View {
        Rectangle()
            .fill(LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0, green: 0.8588235378, blue: 0.870588243, alpha: 1)), location: 0.14285816252231598),
                    .init(color: Color(#colorLiteral(red: 0.9882352948, green: 0, blue: 1, alpha: 1)), location: 0.9374207854270935)]),
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

struct GradientRectangleG_P_Previews: PreviewProvider {
    static var previews: some View {
        GradientRectangleG_P()
    }
}
