//
//  Testing.swift
//  ShareClout
//
//  Created by Daniel Kamel on 18/08/2021.
//

//import SwiftUI
//
//struct Testing: View {
//    
//    @State var clout = Cloutington()
//    
//    @State var cloutPrice = Exchange()
//    
//    var priceInClout: String {
//        
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .currency
//        
//        let bitCloutNanos = Double(clout.postFound?.profileEntryResponse?.coinPriceBitCloutNanos ?? 0)
//        
//        let conversionToClout = bitCloutNanos / Double(1000000000.00)
//        
//        let exchangeRate = Double(cloutPrice.USDCentsPerBitCloutExchangeRate ?? 0) / Double(100)
//
//        let conversionToUSD = conversionToClout * exchangeRate
//        
//        return formatter.string(from: NSNumber(value: conversionToUSD)) ?? "n/a"
//        
//    }
//    
//    var body: some View {
//        
//        VStack {
//            
//            Text(clout.postFound?.profileEntryResponse?.username ?? "n/a")
//            Text("NANOS: \(clout.postFound?.profileEntryResponse?.coinPriceBitCloutNanos ?? 0)")
//            Text("$CLOUT \(priceInClout)")
//            
//        }.onAppear() {
//            
//            fetchResults().getData { (clout) in
//                
//                self.clout = clout
//            }
//            
//            GetExchangeRate().loadData { (cloutPrice) in
//
//                self.cloutPrice = cloutPrice
//
//            }
//            
//        }
//        
//        
//    }
//}
//
//struct Testing_Previews: PreviewProvider {
//    static var previews: some View {
//        Testing()
//    }
//}
