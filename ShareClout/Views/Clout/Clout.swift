//
//  Clout.swift
//  ShareClout
//
//  Created by Daniel Kamel on 22/07/2021.
//

import SwiftUI
import SwiftUIX
import IGStoryKit

//Snapshot Extension:
extension View {
    
    func theNewOfficialSnapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view
        
        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear
        
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        
        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }    
    
}

struct Clout: View {
    
    @StateObject var fetch = fetchResults()
    
    @StateObject var exchange = getExchangeRate()
    
//    var userProfilePic = GetProfilePic()
    
    var priceInClout: String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let bitCloutNanos = Double(fetch.clout.postFound?.profileEntryResponse?.coinPriceBitCloutNanos ?? 0)
        
        let conversionToClout = bitCloutNanos / Double(1000000000.00)
        
        let exchangeRate = Double(exchange.cloutPrice.USDCentsPerBitCloutExchangeRate ?? 0) / Double(100)
        
        let conversionToUSD = conversionToClout * exchangeRate
        
        return formatter.string(from: NSNumber(value: conversionToUSD)) ?? "n/a"
        
        
    }
    
    @EnvironmentObject var igGradientColorModel: IgGradientColorModel
    
    var body: some View {
        
        Group {
            
            if fetch.dataHasLoaded {
                
                Button(action: {
                    
                    let anImage = self.theNewOfficialSnapshot()
                    let officialIgData = IGData(backgroundType: .gradient, colorTop: igGradientColorModel.colorTopLiteral, colorBottom: igGradientColorModel.colorBottomLiteral, backgroundImage: nil, contentSticker: anImage)
                    let officialIgDispatcher = IGDispatcher(igData: officialIgData)
                    officialIgDispatcher.start()
                    
                }, label:{
                    
                    ZStack {
                        VStack {
                            
                            //MARK: - Profile pic, coin price and BitClout logo
                            HStack{
                                
                                
                                ZStack {
                                    //Profile pic
                                    HStack {
                                        Image(uiImage: "https://bitclout.com/api/v0/get-single-profile-picture/\(fetch.clout.postFound?.profileEntryResponse?.publicKeyBase58Check ?? "n/a")".NewLoad())
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: 40)
                                            .frame(maxHeight: 40)
                                            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.3), radius: 10, x: 0, y:10)
                                            .padding(.leading, 20)
                                        Spacer()
                                    }
                                    
                                    //Coin Price
                                    HStack{
                                        Text(priceInClout)
                                            .foregroundColor(.black)
                                            .font(.system(size: 12))
                                            .fontWeight(.semibold)
                                            .padding(.vertical, 3)
                                            .padding(.horizontal, 5)
                                        
                                    }
                                    .background(Color(#colorLiteral(red: 0.8822851777, green: 0.8823911548, blue: 0.8822489381, alpha: 1)))
                                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                    .shadow(color: Color(#colorLiteral(red: 0.06202456727, green: 0.07236060716, blue: 0.1719861585, alpha: 1)).opacity(0.3), radius: 10, x: 0, y:10)
                                    .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 2).fill(Color.white))
                                    .padding(.bottom, 50)
                                    .padding(.top, 5)
                                    .padding(.leading, -45)
                                    
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
                            Text(fetch.clout.postFound?.body ?? "n/a")
                                .foregroundColor(.black)
                                .padding(.horizontal, 30)
                                .font(.system(size: 15, weight: .medium))
                            
                            Spacer().frame(maxHeight: 30)
                            
                            //MARK: - Made with ShareClout
                            HStack {
                                
                                Text("made with")
                                    .font(.system(size: 15, weight: .thin))
                                    .foregroundColor(.black)
                                Text("ShareClout")
                                    .font(.system(size: 15, weight: .regular))
                                    .padding(.leading, -3)
                                    .foregroundColor(.black)
                                
                                
                            }.padding(.trailing, 8)
                            
                            Spacer().frame(maxHeight: 10)
                            
                            //MARK: - Engagement
                            //MARK: - Comments, reclouts, likes, diamonds
                            HStack (spacing: 15){
                                //comments icon:
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
                                        .foregroundColor(.black)
                                    Text(String(fetch.clout.postFound?.likeCount ?? 0))
                                        .foregroundColor(.black)
                                }.padding(.bottom, 10)
                                
                                HStack{
                                    Image(systemName: "repeat")
                                        .rotationEffect(.degrees(90), anchor: .center)
                                        .foregroundColor(.black)
                                    Text(String(fetch.clout.postFound?.recloutCount ?? 0))
                                        .foregroundColor(.black)
                                }.padding(.bottom, 10)
                                
                                
                                
                                HStack{
                                    Image("diamond")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxHeight: 20)
                                    Text(String(fetch.clout.postFound?.diamondCount ?? 0))
                                        .foregroundColor(.black)
                                }.padding(.bottom, 10)
                            }
                            
                            Spacer().frame(maxHeight: 20)
                            
                        }
                        .background(Color.white)
                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.3), radius: 10, x: 0, y:10)
                        .padding()
                        .frame(maxWidth: 300)
                        //                .edgesIgnoringSafeArea(.all)
                        
                        //MARK: Username
                        VStack {
                            VisualEffectBlurView(blurStyle: .light, content: {
                                HStack {
                                    Text("@")
                                        .foregroundColor(.black)
                                        .fontWeight(.semibold)
                                        .font(.system(size: 15))
                                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                    Text(fetch.clout.postFound?.profileEntryResponse?.username ?? "n/a")
                                        .foregroundColor(.black)
                                        .fontWeight(.semibold)
                                        .font(.system(size: 15))
                                        //                            .padding(.leading, 5)
                                        .padding(.leading, -9)
                                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                    
                                    if fetch.clout.postFound?.profileEntryResponse?.isVerified == true {
                                        
                                        Image(systemName: "checkmark.seal.fill")
                                            .foregroundColor(.black)
                                            .font(.system(size: 12))
                                            .padding(.trailing, 5)
                                            .padding(.leading, -7)
                                        
                                    }
                                    
                                }
                                
                            })
                            .frame(width: 100, height: 50)
                            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                            
                            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 0.5).fill(Color.white))
                            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y:10)
                            
                        }
                        .padding(.top, 250)
                        .padding(.leading, 200)
                        
                    }
                    
                })
                
                
            } else {
                
                ProgressView()
                
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
