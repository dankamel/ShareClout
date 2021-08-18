//
//  Clout.swift
//  ShareClout
//
//  Created by Daniel Kamel on 22/07/2021.
//

import SwiftUI
import SwiftUIX

//function to turn profile pic from string to an image

extension String {
    
    func load() -> UIImage {
        return UIImage()
    }
    
}

struct Clout: View {
    
    @State var clout = Cloutington()
    
    var userProfilePic = GetProfilePic()
    
    
    //    @State var CloutText = "Clout insightfully to earn diamonds abundantly."
    
    @State var CloutImage = "ProfilePic"
    
    @State var CoinPrice = "287.83"
    
    //    @State var NoOfComments = "10"
    //    @State var NoOfReclouts = "5"
    //    @State var NoOfLikes = "15"
    //    @State var NoOfDiamonds = "9"
    
    //    @State var Username = "danielk"
    //    @State var isUserVerified = true
    
    
    var body: some View {
        ZStack {
            VStack {
                
                //MARK: - Profile pic, coin pirce and BitClout logo
                HStack{
                    
                    
                    ZStack {
                        //Profile pic
                        HStack {
                            userProfilePic
                            Spacer()
                        }
                        
                        //Coin Price
                        HStack{
                            Text("$")
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                                .padding(.leading, 5)
                            Text(CoinPrice)
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                                .padding(.vertical, 3)
                                .padding(.horizontal, 5)
                                .padding(.leading, -9)
                            
                        }
                        .background(Color(#colorLiteral(red: 0.8822851777, green: 0.8823911548, blue: 0.8822489381, alpha: 1)))
                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .shadow(color: Color(#colorLiteral(red: 0.2241683006, green: 0.2581242323, blue: 0.6071507931, alpha: 1)).opacity(0.3), radius: 10, x: 0, y:10)
                        .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 2).fill(Color.white))
                        .padding(.bottom, 50)
                        //.padding(.leading, -70)
                        
                        
                        
                    }
                    
                    //BitClout logo
                    HStack {
                        Image("BigBitCloutLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 100)
                            .padding(.trailing, -10)
                            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.3), radius: 10, x: 0, y:10)
                        
                    }
                    
                    
                    
                }
                
                Spacer().frame(maxHeight: 5)
                
                //MARK: - CloutText
                Text(clout.postFound?.posterPublicKeyBase58Check ?? "n/a")
                    .padding(.horizontal, 30)
                    .font(.system(size: 15, weight: .medium))
                
                Spacer().frame(maxHeight: 30)
                
                //MARK: - Made with ShareClout
                HStack {
                    
                    Text("made with")
                        .font(.system(size: 15, weight: .thin))
                    Text("ShareClout")
                        .font(.system(size: 15, weight: .regular))
                        .padding(.leading, -3)
                    
                    
                }.padding(.trailing, 8)
                
                Spacer().frame(maxHeight: 10)
                
                //MARK: - Engagement
                //MARK: - Comments, reclouts, likes, diamonds
                HStack (spacing: 15){
                    
                    //                            HStack{
                    //                                Image(systemName: "message")
                    //                                    .rotationEffect(.degrees(180), anchor: .center)
                    //                                    .rotation3DEffect(
                    //                                        .degrees(180),
                    //                                        axis: (x: 1.0, y: 0.0, z: 0.0))
                    //                                Text(NoOfComments)
                    //                            }.padding(.bottom, 10)
                    
                    HStack{
                        Image(systemName: "heart")
                        Text(String(clout.postFound?.likeCount ?? 0))
                    }.padding(.bottom, 10)
                    
                    HStack{
                        Image(systemName: "repeat")
                            .rotationEffect(.degrees(90), anchor: .center)
                        Text(String(clout.postFound?.recloutCount ?? 0))
                    }.padding(.bottom, 10)
                    
                    
                    
                    HStack{
                        Image("diamond")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 20)
                        Text(String(clout.postFound?.diamondCount ?? 0))
                    }.padding(.bottom, 10)
                    
                }
                
                Spacer().frame(maxHeight: 20)
                
            }
            .background(Color.white)
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.3), radius: 10, x: 0, y:10)
            .padding()
            .frame(maxWidth: 300)
            
            //MARK: - Glassmorphic username and verification
            VStack {
                VisualEffectBlurView(blurStyle: .light, content: {
                    HStack {
                        Text("@")
                            .fontWeight(.semibold)
                            .font(.system(size: 15))
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        Text(clout.postFound?.profileEntryResponse?.username ?? "n/a")
                            .fontWeight(.semibold)
                            .font(.system(size: 15))
                            //                            .padding(.leading, 5)
                            .padding(.leading, -9)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        
                        if clout.postFound?.profileEntryResponse?.isVerified == true {
                            
                            Image(systemName: "checkmark.seal.fill")
                                .font(.system(size: 12))
                                .padding(.trailing, 5)
                                .padding(.leading, -7)
                            
                        }
                        
                    }
                    
                })
                .frame(maxWidth: 100, maxHeight: 50)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                
                .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 0.5).fill(Color.white))
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y:10)
                
            }
            .padding(.top, 250)
            .padding(.leading, 200)
            
        }.onAppear() {
            
            fetchResults().getData { (clout) in
                
                self.clout = clout
            }
            
        }
        
        
        
        
        
    }
}

struct Clout_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Clout()
        }
    }
}
