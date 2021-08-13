//
//  GetPost.swift
//  ShareClout
//
//  Created by Daniel Kamel on 22/07/2021.
//

import SwiftUI

class fetchResults {
    
    func getData(completion: @escaping (Cloutington) -> ()) {
        let parameters =  "{\r\n \"PostHashHex\": \"fe8d0fee323e3280ffc7b3cb21bf0e0ce672887692de472f0647f3bf07643764\"\r\n}"
        let postData = parameters.data(using: .utf8)
        var request =  URLRequest(url: URL(string: "https://bitclout.com/api/v0/get-single-post")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = postData
        request.httpMethod = "POST"
        
        
        let task =  URLSession.shared.dataTask(with: request) { (responseData, response, error) in

            print(error)
            print(response)
            print(responseData)
            
            if let resData = responseData {
                let decoder = JSONDecoder()
                
                do
                {
                    let finalData = try decoder.decode(Cloutington.self, from: resData)
                    DispatchQueue.main.async {
                        completion(finalData)
                    }
                    
                }
                catch (let error)
                {
                    print(error)
                }

            }
            
        }
        task.resume()
        
    }
    
}

//Testing:

struct GetPost: View {
    
    @State var clout = Cloutington()
    
    var body: some View {
        
        VStack{
            
            Text(clout.postFound?.profileEntryResponse?.publicKeyBase58Check ?? "n/a")
            
        }.onAppear() {
            
            fetchResults().getData { (clout) in
                
                self.clout = clout
            }
            
        }
    }
}
