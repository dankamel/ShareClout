//
//  RandomClout.swift
//  ShareClout
//
//  Created by Daniel Kamel on 25/09/2021.
//

//import SwiftUI
//
//struct RandomClout: View {
//    
//    @StateObject var resultFetcher = ResultFetcher()
//    
//    var body: some View {
//        Text(resultFetcher.clout.postFound?.body ?? "n/a")
//            .padding()
//            .background(Color.white)
//            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
//            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.3), radius: 10, x: 0, y:10)
//            .padding()
//            .frame(maxWidth: 300)
//            .onChange(of: StackAnswerTest().text) { text in
//                
//                resultFetcher.updateData(postHashHex: text)
//                
//            }
//            
//    }
//}
//
//struct RandomClout_Previews: PreviewProvider {
//    static var previews: some View {
//        RandomClout()
//    }
//}
