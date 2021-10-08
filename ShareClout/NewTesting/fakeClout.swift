////
////  fakeClout.swift
////  ShareClout
////
////  Created by Daniel Kamel on 18/09/2021.
////
//
//import SwiftUI
//
//extension View {
//
//    func fakeSnapshot() -> UIImage {
//        let controller = UIHostingController(rootView: self)
//        let view = controller.view
//
//        let targetSize = controller.view.intrinsicContentSize
//        view?.bounds = CGRect(origin: .zero, size: targetSize)
//        view?.backgroundColor = .clear
//
//        let renderer = UIGraphicsImageRenderer(size: targetSize)
//
//        return renderer.image { _ in
//            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
//        }
//    }
//
//}
//
//struct fakeClout: View {
//    
//    @StateObject var fetch = fetchResults()
//    
//    @StateObject var exchange = getExchangeRate()
//    
//    var userProfilePic = GetProfilePic()
//    
//    var priceInClout: String {
//        
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .currency
//        
//        let bitCloutNanos = Double(fetch.clout.postFound?.profileEntryResponse?.coinPriceBitCloutNanos ?? 0)
//        
//        let conversionToClout = bitCloutNanos / Double(1000000000.00)
//        
//        let exchangeRate = Double(exchange.cloutPrice.USDCentsPerBitCloutExchangeRate ?? 0) / Double(100)
//        
//        let conversionToUSD = conversionToClout * exchangeRate
//        
//        return formatter.string(from: NSNumber(value: conversionToUSD)) ?? "n/a"
//        
//        
//    }
//    
//    var body: some View {
//        
//        Group{
//            
//            if fetch.dataHasLoaded {
//                
//                VStack{
//                    
//                    ZStack {
//                        VStack {
//                            
//                            //MARK: - Profile pic, coin price and BitClout logo
//                            VStack {
//                                HStack{
//                                    
//                                    
//                                    ZStack {
//                                        //Profile pic
//                                        HStack {
//                                            Image("ProfilePic")
//                                                .resizable()
//                                                .aspectRatio(contentMode: .fit)
//                                                .frame(maxWidth: 40)
//                                                .frame(maxHeight: 40)
//                                                .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
//                                                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.3), radius: 10, x: 0, y:10)
//                                                .padding(.leading, 20)
//                                            Spacer()
//                                        }
//                                        
//                                        //Coin Price
//                                        HStack{
//                                            Text("5,000")
//                                                .font(.system(size: 12))
//                                                .fontWeight(.semibold)
//                                                .padding(.vertical, 3)
//                                                .padding(.horizontal, 5)
//                                            
//                                        }
//                                        .background(Color(#colorLiteral(red: 0.8822851777, green: 0.8823911548, blue: 0.8822489381, alpha: 1)))
//                                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
//                                        .shadow(color: Color(#colorLiteral(red: 0.06202456727, green: 0.07236060716, blue: 0.1719861585, alpha: 1)).opacity(0.3), radius: 10, x: 0, y:10)
//                                        .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 2).fill(Color.white))
//                                        .padding(.bottom, 50)
//                                        .padding(.top, 5)
//                                        .padding(.leading, -45)
//                                        
//                                    }
//                                    
//                                    //BitClout logo
//                                    HStack {
//                                        Image("BigBitCloutLogo")
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fit)
//                                            .frame(maxHeight: 100)
//                                            .padding(.trailing, -10)
//                                            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.3), radius: 10, x: 0, y:10)
//                                        
//                                    }
//                                    
//                                    
//                                    
//                                }
//                                //MARK: - username
//                                Text("@danielk")
//                                    .padding(.top, -30)
//                                    .padding(.trailing, 180)
//                                    .font(.system(size: 12, weight: .bold))
//                                    .foregroundColor(Color(#colorLiteral(red: 0.3419598043, green: 0.3399323225, blue: 0.3435217142, alpha: 1)))
//                                
//                            }
//                            
//                            Spacer().frame(maxHeight: 5)
//                            
//                            //MARK: - CloutText
//                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
//                                .padding(.horizontal, 30)
//                                .font(.system(size: 15, weight: .medium))
//                            
//                            Spacer().frame(maxHeight: 30)
//                            
//                            //MARK: - Made with ShareClout
//                            HStack {
//                                
//                                Text("made with")
//                                    .font(.system(size: 15, weight: .thin))
//                                Text("ShareClout")
//                                    .font(.system(size: 15, weight: .regular))
//                                    .padding(.leading, -3)
//                                
//                                
//                            }.padding(.trailing, 8)
//                            
//                            Spacer().frame(maxHeight: 10)
//                            
//                            //MARK: - Engagement
//                            //MARK: - Comments, reclouts, likes, diamonds
//                                HStack (spacing: 15){
//                                    //comments icon:
//                                    //                            HStack{
//                                    //                                Image(systemName: "message")
//                                    //                                    .rotationEffect(.degrees(180), anchor: .center)
//                                    //                                    .rotation3DEffect(
//                                    //                                        .degrees(180),
//                                    //                                        axis: (x: 1.0, y: 0.0, z: 0.0))
//                                    //                                Text(NoOfComments)
//                                    //                            }.padding(.bottom, 10)
//                                    
//                                    HStack{
//                                        Image(systemName: "heart")
//                                        Text("15")
//                                    }.padding(.bottom, 10)
//                                    
//                                    HStack{
//                                        Image(systemName: "repeat")
//                                            .rotationEffect(.degrees(90), anchor: .center)
//                                        Text("20")
//                                    }.padding(.bottom, 10)
//                                    
//                                    
//                                    
//                                    HStack{
//                                        Image("diamond")
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fit)
//                                            .frame(maxHeight: 20)
//                                        Text("69")
//                                    }.padding(.bottom, 10)
//                                }
//                            
//                            Spacer().frame(maxHeight: 20)
//                            
//                        }
//                        .background(Color.white)
//                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
//                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.3), radius: 10, x: 0, y:10)
//                        .padding()
//                        .frame(maxWidth: 320)
//                        //                .edgesIgnoringSafeArea(.all)
//                        
////                        Username()
//                        
//                    }
//                    
//                }
//                
//            } else {
//                
//                Text("this is a joke")
//                
//            }
//            
//        }
//        
//        
//        
//    }
//}
//
//struct fakeClout_Previews: PreviewProvider {
//    static var previews: some View {
//        fakeClout()
//    }
//}
