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
    func asImage() -> UIImage {
        let controller = UIHostingController(rootView: self)

        // locate far out of screen
        controller.view.frame = CGRect(x: 0, y: CGFloat(Int.max), width: 1, height: 1)
        UIApplication.shared.windows.first!.rootViewController?.view.addSubview(controller.view)

        let size = controller.sizeThatFits(in: UIScreen.main.bounds.size)
        controller.view.bounds = CGRect(origin: .zero, size: size)
        controller.view.sizeToFit()
        controller.view.backgroundColor = .clear

        let image = controller.view.asImage()
        controller.view.removeFromSuperview()
        return image
    }
}

extension UIView {
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
// [!!] Uncomment to clip resulting image
//             rendererContext.cgContext.addPath(
//                UIBezierPath(roundedRect: bounds, cornerRadius: 20).cgPath)
//            rendererContext.cgContext.clip()

// As commented by @MaxIsom below in some cases might be needed
// to make this asynchronously, so uncomment below DispatchQueue
// if you'd same met crash
//            DispatchQueue.main.async {
                 layer.render(in: rendererContext.cgContext)
//            }
        }
    }
}

struct Clout: View {
    
    var resultFetcher = ResultFetcher()
    
    init(result: ResultFetcher) {
            self.resultFetcher = result
        }
    
    @StateObject var exchange = getExchangeRate()
    
//    var userProfilePic = GetProfilePic()
    
    var priceInClout: String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let bitCloutNanos = Double(resultFetcher.clout.postFound?.profileEntryResponse?.coinPriceBitCloutNanos ?? 0)
        
        let conversionToClout = bitCloutNanos / Double(1000000000.00)
        
        let exchangeRate = Double(exchange.cloutPrice.USDCentsPerBitCloutExchangeRate ?? 0) / Double(100)
        
        let conversionToUSD = conversionToClout * exchangeRate
        
        return formatter.string(from: NSNumber(value: conversionToUSD)) ?? "n/a"
        
        
    }
    
    @EnvironmentObject var igGradientColorModel: IgGradientColorModel
    
//    @EnvironmentObject var cloutHashHex: CloutHashHex
    
    
    var body: some View {
        
        Group {
            
            if resultFetcher.dataHasLoaded {
                    
                    Button(action: {
                        
                        let anImage = self.asImage()
//                        print(anImage)
                        let officialIgData = IGData(backgroundType: .gradient, colorTop: igGradientColorModel.colorTopLiteral, colorBottom: igGradientColorModel.colorBottomLiteral, backgroundImage: nil, contentSticker: anImage)
                        let officialIgDispatcher = IGDispatcher(igData: officialIgData)
                        officialIgDispatcher.start()
                        
                    }, label:{
                        ZStack{
                            VStack {
                                
                                //MARK: - Profile pic, coin price and BitClout logo
                                HStack{
                                    
                                    
                                    ZStack {
                                        //Profile pic
                                        HStack {
                                            Image(uiImage: "https://bitclout.com/api/v0/get-single-profile-picture/\(resultFetcher.clout.postFound?.profileEntryResponse?.publicKeyBase58Check ?? "n/a")".NewLoad())
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
                                
                                //MARK: - username
                                
//                                HStack {
//                                    Text("@")
//                                        .foregroundColor(Color(#colorLiteral(red: 0.3419598043, green: 0.3399323225, blue: 0.3435217142, alpha: 1)))
//                                        .fontWeight(.bold)
//                                        .font(.system(size: 15))
//                                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
//                                    Text(resultFetcher.clout.postFound?.profileEntryResponse?.username ?? "n/a")
//                                        .foregroundColor(Color(#colorLiteral(red: 0.3419598043, green: 0.3399323225, blue: 0.3435217142, alpha: 1)))
//                                        .fontWeight(.bold)
//                                        .font(.system(size: 15))
//                                        .padding(.leading, -9)
//                                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
//                                    
//                                    if resultFetcher.clout.postFound?.profileEntryResponse?.isVerified == true {
//                                        
//                                        Image(systemName: "checkmark.seal.fill")
//                                            .foregroundColor(Color(#colorLiteral(red: 0.3419598043, green: 0.3399323225, blue: 0.3435217142, alpha: 1)))
//                                            .font(.system(size: 12, weight: .bold))
//                                            .padding(.trailing, 5)
//                                            .padding(.leading, -7)
//                                        
//                                    }
//                                    
//                                }
//                                .padding(.top, -30)
//                                .padding(.trailing, 120)
                                

                                
                                
                                Spacer().frame(maxHeight: 5)
                                
                                //MARK: - CloutText
                                Text(resultFetcher.clout.postFound?.body ?? "n/a")
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
                                        Text(String(resultFetcher.clout.postFound?.likeCount ?? 0))
                                            .foregroundColor(.black)
                                    }.padding(.bottom, 10)
                                    
                                    HStack{
                                        Image(systemName: "repeat")
                                            .rotationEffect(.degrees(90), anchor: .center)
                                            .foregroundColor(.black)
                                        Text(String(resultFetcher.clout.postFound?.recloutCount ?? 0))
                                            .foregroundColor(.black)
                                    }.padding(.bottom, 10)
                                    
                                    
                                    
                                    HStack{
                                        Image("diamond")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxHeight: 20)
                                        Text(String(resultFetcher.clout.postFound?.diamondCount ?? 0))
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
                            
//                            MARK: Old Username
//                            VStack {
//                                VisualEffectBlurView(blurStyle: .light, content: {
//                                    HStack {
//                                        Text("@")
//                                            .foregroundColor(.black)
//                                            .fontWeight(.semibold)
//                                            .font(.system(size: 15))
//                                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
//                                        Text(resultFetcher.clout.postFound?.profileEntryResponse?.username ?? "n/a")
//                                            .foregroundColor(.black)
//                                            .fontWeight(.semibold)
//                                            .font(.system(size: 15))
//                                            //                            .padding(.leading, 5)
//                                            .padding(.leading, -9)
//                                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
//
//                                        if resultFetcher.clout.postFound?.profileEntryResponse?.isVerified == true {
//
//                                            Image(systemName: "checkmark.seal.fill")
//                                                .foregroundColor(.black)
//                                                .font(.system(size: 12))
//                                                .padding(.trailing, 5)
//                                                .padding(.leading, -7)
//
//                                        }
//
//                                    }
//
//                                })
//                                .frame(width: 100, height: 50)
//                                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
//
//                                .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 0.5).fill(Color.white))
//                                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y:10)
//
//                            }
//                            .padding(.top, 250)
//                            .padding(.leading, 200)
                        
                    }
                        
                    })
                    
                
                
            } else {
                
                ProgressView()
                
            }
            
            
        }
        
        
        
        
    }
}

//struct Clout_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            Clout()
//        }
//    }
//}
