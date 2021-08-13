//
//  NewGetProfilePic.swift
//  ShareClout
//
//  Created by Daniel Kamel on 11/08/2021.
//

import SwiftUI

class NewFetchResults {
    
    func NewGetData() {
//        let parameters =  "{\r\n \"PostHashHex\": \"46f1728423186a6fd6ebfa029c2ed5612f9ddbbb66577d9b82619c12c994793c\"\r\n}"
//        let postData = parameters.data(using: .utf8)
        
        var clout = Cloutington()
        var newRequest =  URLRequest(url: URL(string: "https://bitclout.com/api/v0/get-single-post/\(clout.postFound?.profileEntryResponse?.publicKeyBase58Check)")!,timeoutInterval: Double.infinity)
//        newRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpBody = postData
        newRequest.httpMethod = "GET"
        
        
        let task =  URLSession.shared.dataTask(with: newRequest) { (responseData, response, error) in

            print(error)
            print(response)
            print(responseData)
            
            if let resData = responseData {
                let decoder = JSONDecoder()
                
                //what JSON data do I need to decode for an this?
                
                do
                {
                    let finalData = try decoder.decode(Cloutington.self, from: resData)
//                    DispatchQueue.main.async {
//                        completion(finalData)
//                    }
                    
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

struct NewGetPost: View {
    
    @State var clout = Cloutington()
    
    var body: some View {
        
        VStack{
            
            Text(clout.postFound?.profileEntryResponse?.publicKeyBase58Check ?? "n/a")
            
        }//.onAppear() {
            
//            NewFetchResults().NewGetData { (clout) in
//
//                self.clout = clout
//            }
//
//        }
    }
}


struct Profilington: Decodable {
    
    var PublicKeyBase58Check: String?
    
}
