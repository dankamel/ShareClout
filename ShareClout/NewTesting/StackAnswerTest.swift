//
//  StackAnswerTest.swift
//  ShareClout
//
//  Created by Daniel Kamel on 25/09/2021.
//

import SwiftUI

class ResultFetcher: ObservableObject {

    @Published var clout = Cloutington()
    @Published var dataHasLoaded = false
    @State var initialPostHashHex: String = "8004bb672ad3f46118775cd4b2cb5306c63f6d68787457990bf0d2fda3f7993a"

    init() {
        updateData(postHashHex: StackAnswerTest().text)
    }

    func updateData(postHashHex: String) {
        getData(postHashHex: postHashHex) { clout in
            self.clout = clout
        }
    }

    private func getData(postHashHex: String, completion: @escaping (Cloutington) -> ()) {
        let parameters =  "{\r\n \"PostHashHex\": \"\(postHashHex)\"\r\n}"
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
                        self.dataHasLoaded = true

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

struct StackAnswerTest: View {
    @StateObject var resultFetcher = ResultFetcher()

    @State var text = ""

    var body: some View {
            
        NavigationView {
        
            VStack {
        TextField("Paste Clout Hexcode Here", text: $text)
            .font(.title2)
            .padding()
            .onChange(of: text) { text in
                resultFetcher.updateData(postHashHex: text)
            }
                
                Text(resultFetcher.clout.postFound?.body ?? "n/a")
                
                NavigationLink(
                    destination: NewDesignScreen(), label: {
                        
                            DesignButton()
                        
                    })
        
            }
            
        }

    }


}

//need to change clout to new class name 
