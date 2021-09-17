//
//  Clout.swift
//  ShareClout
//
//  Created by Daniel Kamel on 22/07/2021.
//

import SwiftUI
import SwiftUIX

extension View {

    func officialSnapshot() -> UIImage {
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

    var officialCloutView: some View {
        Clout()
    }
    
    @StateObject var fetch = fetchResults()
    
    @StateObject var exchange = getExchangeRate()
    
    var userProfilePic = GetProfilePic()
    
    var priceInClout: String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let bitCloutNanos = Double(fetch.clout.postFound?.profileEntryResponse?.coinPriceBitCloutNanos ?? 0)
        
        let conversionToClout = bitCloutNanos / Double(1000000000.00)
        
        let exchangeRate = Double(exchange.cloutPrice.USDCentsPerBitCloutExchangeRate ?? 0) / Double(100)
        
        let conversionToUSD = conversionToClout * exchangeRate
        
        return formatter.string(from: NSNumber(value: conversionToUSD)) ?? "n/a"
        
        
    }
    
    
    
    var body: some View {
        ZStack {
            VStack {
                
                //MARK: - Profile pic, coin price and BitClout logo
                HStack{
                    
                    
                    ZStack {
                        //Profile pic
                        HStack {
                            userProfilePic
                            Spacer()
                        }
                        
                        //Coin Price
                        HStack{
                            Text(priceInClout)
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
                        Text(String(fetch.clout.postFound?.likeCount ?? 0))
                    }.padding(.bottom, 10)
                    
                    HStack{
                        Image(systemName: "repeat")
                            .rotationEffect(.degrees(90), anchor: .center)
                        Text(String(fetch.clout.postFound?.recloutCount ?? 0))
                    }.padding(.bottom, 10)
                    
                    
                    
                    HStack{
                        Image("diamond")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 20)
                        Text(String(fetch.clout.postFound?.diamondCount ?? 0))
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
            
            
            Username()
            
            
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
