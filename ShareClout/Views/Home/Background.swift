//
//  Background.swift
//  ShareClout
//
//  Created by Daniel Kamel on 22/07/2021.
//

import SwiftUI

struct Background: View {
    var body: some View {
        
        ZStack {
            
            //MARK: - Background gradient
            LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: Color(#colorLiteral(red: 0.09753474593162537, green: 0.13194799423217773, blue: 0.4416666626930237, alpha: 1)), location: 0),
                        .init(color: Color(#colorLiteral(red: 0.30114585161209106, green: 0.3423113226890564, blue: 0.737500011920929, alpha: 1)), location: 1)]),
                            startPoint: UnitPoint(x: 1.2641510093454111, y: 0.036649972996642764),
                endPoint: UnitPoint(x: 1.2641510093454111, y: 0.9813847422798069)).ignoresSafeArea()
            
            //MARK: - Shapes

            //Commenting out images for now because they look uuuuglllyyy
            
            Image("MountainGroup")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .position(x: 220, y: 300)
//            animate this to move down and right
//            Image("MoveableMountain")
//                .position(x: 220, y: 350)
            //animate this to move down and left
//            Image("MoveableMountain")
//                .position(x: 600, y: 350)

            
        }
        
        
                 
            
        
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background()
    }
}

