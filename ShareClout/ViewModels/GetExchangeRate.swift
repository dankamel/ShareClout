//
//  GetExchangeRate.swift
//  ShareClout
//
//  Created by Daniel Kamel on 19/08/2021.
//

import SwiftUI

class getExchangeRate: ObservableObject {
    
    @Published var cloutPrice = Exchange()
    @Published var priceDataHasLoaded = false
    
    init() {
        
        loadData { cloutPrice in
            self.cloutPrice = cloutPrice
        }
        
    }
    
    private func loadData(completion: @escaping (Exchange) -> ()) {
        
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
                        self.priceDataHasLoaded = true
                        
                    }
                    
                } catch (let error) {
                    
                    print(error)
                    
                }
                
            }
            
        }
        exchangeTask.resume()
        
    }
    
}

