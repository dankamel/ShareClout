//
//  GetProfilePic.swift
//  ShareClout
//
//  Created by Daniel Kamel on 11/08/2021.
//

import SwiftUI

struct GetProfilePic: View {
    
    @State var clout = Cloutington()
    @State var profilePicURL = String()
    @State var searchString = String()
    
    var body: some View {
        Text("\(profilePicURL)")
            .onTapGesture {
                let url = URL(string: profilePicURL)
                guard let PicURL = url, UIApplication.shared.canOpenURL(PicURL) else {return}
                UIApplication.shared.open(PicURL)
            }
        TextField("Search Profile Pic by Public Base Key", text: $searchString)
            .multilineTextAlignment(.center)
        Button("Fetch Profile Pic"){fetchProfilePic()}
    }
    
    func fetchProfilePic() {

        let url = URL(string: "https://bitclout.com/api/v0/get-single-profile-picture/\(self.searchString)")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            
            if let data = data {
                
                if let decodedProfilePic = try? JSONDecoder().decode(ProfilePicStructure.self, from: data) {
                    
                    self.profilePicURL = decodedProfilePic.data[0].url
                    
                }
                
            }
            
            
        }.resume()
        
        
    }
    
}

struct ProfilePicStructure: Decodable {
    
    let data: [dataStructure]
    
}

struct dataStructure: Decodable {
    
    let url: String
    
}
