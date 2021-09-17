//
//  GradientRectangleB_R.swift
//  ShareClout
//
//  Created by Daniel Kamel on 22/07/2021.
//

import SwiftUI

struct GradientRectangleB_R: View {
    var body: some View {
        Rectangle()
            .fill(LinearGradient(
                    gradient: Gradient(stops: [
                                        .init(color: .red, location: 0.30430516600608826),
                                        .init(color: .blue, location: 0.96122807264328)]),
                    startPoint: UnitPoint(x: 0.038226294105655145, y: 0.03625000673847295),
                    endPoint: UnitPoint(x: 1.000000060049398, y: 1.0387500002230592)))
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

struct GradientRectangleB_R_Previews: PreviewProvider {
    static var previews: some View {
        GradientRectangleB_R()
    }
}
