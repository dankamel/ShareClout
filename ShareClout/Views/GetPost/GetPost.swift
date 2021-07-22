//
//  GetPost.swift
//  ShareClout
//
//  Created by Daniel Kamel on 22/07/2021.
//

import SwiftUI

struct GetPost: View {
    
    @State public var data = PostFound(postHashHex: "Test")
    
    func getData() {
        let parameters =  "{\r\n \"PostHashHex\": \"fc758ab87c6ab63ab54d18d8db63cdc7f3c2587145d0953e904b95928203a1d0\"\r\n}"
        let postData = parameters.data(using: .utf8)
        var request =  URLRequest(url: URL(string: "https://bitclout.com/api/v0/get-single-post")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = postData
        request.httpMethod = "POST"
        
        
        let task =  URLSession.shared.dataTask(with: request) { (responseData, response, error) in

            print(error)
            print(response)
            print(responseData)
            // check for errors, then...

            if let resData = responseData {
                let decoder = JSONDecoder()
                
                do
                {
                    let finalData = try decoder.decode(Instruction.self, from: resData)
                    print(finalData.postFound?.body)
                }
                catch (let error)
                {
                    print(error)
                }
                

            }
        }
        task.resume()
        
        /*
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            DispatchQueue.main.async {
                
                print(response)
                guard let data = data else { return }
                
                let decoder = JSONDecoder()
                
                do
                {
                    let finalData = try decoder.decode(PostFound.self, from: data)
                    print(finalData.commentCount)
                }
                catch (let error)
                {
                    print(error.localizedDescription)
                }
             
                 
            
                
               
                

//                if let data = data {
//                    do {
//                        let decoder = JSONDecoder()
//                        let decodedData = try decoder.decode(CloutPost.self, from: data)
//                        self.data = decodedData
//                    } catch {
//                        print("Something went wrong - ERROR")
//                    }
//                }
            }
            
            
            
        }
        task.resume()
        
        */
        
        
        
    }
    
    var body: some View {
        
        VStack{
            Button(action: {self.getData()}, label: {
                Text("Refresh")
            })
            Text(data.postHashHex ?? "N/A")
        }
    }
}

