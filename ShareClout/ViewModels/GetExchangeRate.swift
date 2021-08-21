//
//  GetExchangeRate.swift
//  ShareClout
//
//  Created by Daniel Kamel on 19/08/2021.
//

import SwiftUI

class GetExchangeRate: ObservableObject {
    
    func loadData(completion: @escaping (Exchange) -> ()) {
        
        var exchangeRequest =  URLRequest(url: URL(string: "https://bitclout.com/api/v0/get-exchange-rate")!,timeoutInterval: Double.infinity)
        exchangeRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        exchangeRequest.httpMethod = "GET"
        
        let exchangeTask = URLSession.shared.dataTask(with: exchangeRequest) { (responseData, response, error) in
            
            print(error)
            print(response)
            print(responseData)
            
            if let resData = responseData {
                
                let decoder = JSONDecoder()
                
                do {
                    
                    let finalData = try decoder.decode(Exchange.self, from: resData)
                    print(finalData.USDCentsPerBitCloutExchangeRate)
                    DispatchQueue.main.async {
                        completion(finalData)
                    }
                    
                } catch (let error) {
                    
                    print(error)
                    
                }
                
            }
            
        }
        exchangeTask.resume()
        
    }
    
}

//Testing

struct GetExchangeRateView: View {
    
    @State var cloutPrice = Exchange()
    
    var body: some View {
        
        VStack {
            
            Text(String(cloutPrice.USDCentsPerBitCloutExchangeRate ?? 0))
            
        }.onAppear() {

            GetExchangeRate().loadData { (cloutPrice) in

                self.cloutPrice = cloutPrice

            }

        }
        
    }
}

