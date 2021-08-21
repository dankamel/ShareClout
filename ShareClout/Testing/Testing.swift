//
//  Testing.swift
//  ShareClout
//
//  Created by Daniel Kamel on 18/08/2021.
//

import SwiftUI

struct Testing: View {
    
    @State var clout = Cloutington()
    
    //@State var rate = GetExchangeRate()
    
    var priceInClout: String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let bitCloutNanos = Double(clout.postFound?.profileEntryResponse?.coinPriceBitCloutNanos ?? 0)
        
        let conversionToClout = bitCloutNanos / Double(1000000000.00)
        
        //let exchangeRate = Double (GetExchangeRate.USDCentsPerBitCloutExchangeRate ?? 0)
        
        // let conversionToUSD = conversionToClout * (exchangeRate/100)
        
        return formatter.string(from: NSNumber(value: conversionToClout)) ?? "n/a"
        
    }
    
    var body: some View {
        
        VStack {
            
            Text(clout.postFound?.profileEntryResponse?.username ?? "n/a")
            Text("NANOS: \(clout.postFound?.profileEntryResponse?.coinPriceBitCloutNanos ?? 0)")
            Text("$CLOUT \(priceInClout)")
            
        }.onAppear() {
            
            fetchResults().getData { (clout) in
                
                self.clout = clout
            }
            
            //need to also fetch GetExchangeRate data on appear
            
        }
        
        
    }
}

struct Testing_Previews: PreviewProvider {
    static var previews: some View {
        Testing()
    }
}
