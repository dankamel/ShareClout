//
//  NewDesignScreen.swift
//  ShareClout
//
//  Created by Daniel Kamel on 22/07/2021.
//

import SwiftUI
import IGStoryKit

// extension to save clout to camera roll
extension View {

    func snapshot() -> UIImage {
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

struct NewDesignScreen: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    //Background color state changes
    @State var isGradientRectangleB_RShowing = true
    @State var isGradientRectangleP_B_GShowing = false
    @State var isGradientRectangleG_PShowing = false
    
    //Pattern state changes
    @State var isRepeatingBitCloutBackgroundShowing = false
    @State var isBigBitCloutLogoShowing = false
    
    //Selector grey circle for Color on button tap state changes
    @State var ColourDidTap1:Bool = true
    @State var ColourDidTap2:Bool = false
    @State var ColourDidTap3:Bool = false
    
    //Left chevron appear only when tab != Color
    @State var shouldHide = false
    
    //Color gradient model magic
    @EnvironmentObject var igGradientColorModel: IgGradientColorModel
    
    var resultFetcher = ResultFetcher()
    
    init(result: ResultFetcher) {
        self.resultFetcher = result
    }
    
    
    var body: some View {
        
        ZStack {
            NavigationView{
                ZStack{
                    Background()
                    
                }
                
            }
            
            VStack (spacing: 30) {
                
                //MARK: - Chevron Left to Home
                CustomNavView().frame(maxHeight: 10).padding(.top, 5)
                
                //MARK: - Backgrounds (Gradient & Pattern)
                ZStack{
                    
                    GradientRectangleB_R()
                    
                    if isGradientRectangleP_B_GShowing {
                        GradientRectangleP_B_G()
                    }
                    
                    if isGradientRectangleG_PShowing{
                        GradientRectangleG_P()
                    }
                    
                    if isRepeatingBitCloutBackgroundShowing {
                        
                        RepeatingBitCloutBackground()
                        
                    }
                    
                    if isBigBitCloutLogoShowing {
                        
                        BigBitCloutLogo()
                        
                    }
                    
                    Clout(result: resultFetcher)
                        .padding(.top, 50)
                    
                    
                }
                
                //MARK: - Customier Tab
                VStack{
                    
                    TabView (){
                        
                        ForEach(Customiser_Data) { customiser in
                            
                            ZStack {
                                
                                HStack {
                                    
                                    Spacer()
                                    
                                    
                                    //Left chevron appears only when tab != Color tab
                                    HStack {
                                        
                                        if customiser.title != "Color" {
                                            
                                            Button(action: {}, label: {
                                                Image(systemName: "chevron.left")
                                                    .foregroundColor(Color(#colorLiteral(red: 0.3814319372, green: 0.3971602917, blue: 0.508882463, alpha: 1)))
                                                    .font(.system(size: 20, weight: .semibold))
                                            })
                                            
                                        }
                                        
                                    }
                                    
                                    Spacer()
                                    Spacer()
                                    Text(customiser.title)
                                        .fontWeight(.semibold)
                                        .font(.system(size: 20))
                                        .foregroundColor(Color(#colorLiteral(red: 0.3814319372, green: 0.3971602917, blue: 0.508882463, alpha: 1)))
                                    Spacer()
                                    Spacer()
                                    
                                    //Right chevron dissapears when tab == Share
                                    HStack {
                                        
                                        if customiser.title != "Share" {
                                        
                                        Button(action: {}, label: {
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(Color(#colorLiteral(red: 0.3814319372, green: 0.3971602917, blue: 0.508882463, alpha: 1)))
                                                .font(.system(size: 20, weight: .semibold))
                                        })
                                            
                                        }
                                    }
                                    
                                    Spacer()
                                }.padding(.bottom, 150)
                                
                                
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        
                                        ColourDidTap1 = true
                                        ColourDidTap2 = false
                                        ColourDidTap3 = false
                                        
                                        if customiser.title == "Color" {
                                            
                                            isGradientRectangleB_RShowing = true
                                            isGradientRectangleP_B_GShowing = false
                                            isGradientRectangleG_PShowing = false
                                            
                                            igGradientColorModel.colorTopLiteral = .red
                                            igGradientColorModel.colorBottomLiteral = .blue
                                            
                                            
                                        } else if customiser.title == "Pattern" {
                                            
                                            isRepeatingBitCloutBackgroundShowing = false
                                            isBigBitCloutLogoShowing = false
                                            
                                            
                                        } else if customiser.title == "Share" {
                                            
//                                            let igDispatcher = IGDispatcher(igData: igData)
//                                                           igDispatcher.start()
//                                            
//                                            let aNewImage = self.theNewOfficialSnapshot()
//                                            print(aNewImage)
                                            
                                        }
                                        
                                        
                                        
                                    }, label: {
                                        Image(customiser.image1)
                                            .padding(.all, 5)
                                            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 2.0).fill(ColourDidTap1 ? Color(#colorLiteral(red: 0.3778246641, green: 0.3981202841, blue: 0.5109930038, alpha: 1)): Color(#colorLiteral(red: 0.7390274405, green: 0.7610722184, blue: 0.9567404389, alpha: 1))))
                                    })
                                    Spacer()
                                    Button(action: {
                                        
                                        ColourDidTap2 = true
                                        ColourDidTap1 = false
                                        ColourDidTap3 = false
                                        
                                        if customiser.title == "Color" {
                                            
                                            isGradientRectangleP_B_GShowing = true
                                            isGradientRectangleG_PShowing = false
                                            
                                            igGradientColorModel.colorTopLiteral = #colorLiteral(red: 0.980392158, green: 0.5450980663, blue: 1, alpha: 1)
                                            igGradientColorModel.colorBottomLiteral = #colorLiteral(red: 0.16862745583057404, green: 0.8235294222831726, blue: 1, alpha: 1)
                                            
                                        } else if customiser.title == "Pattern" {
                                            
                                            isRepeatingBitCloutBackgroundShowing = true
                                            isBigBitCloutLogoShowing = false
                                            
                                            
                                        }
                                        
                                        
                                        
                                    }, label: {
                                        Image(customiser.image2)
                                            .padding(.all, 5)
                                            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 2.0).fill(ColourDidTap2 ? Color(#colorLiteral(red: 0.3778246641, green: 0.3981202841, blue: 0.5109930038, alpha: 1)): Color(#colorLiteral(red: 0.7390274405, green: 0.7610722184, blue: 0.9567404389, alpha: 1))))
                                        
                                    })
                                    Spacer()
                                    Button(action: {
                                        
                                        ColourDidTap3 = true
                                        ColourDidTap2 = false
                                        ColourDidTap1 = false
                                        
                                        if customiser.title == "Color" {
                                            
                                            isGradientRectangleG_PShowing = true
                                            isGradientRectangleP_B_GShowing = false
                                            
                                            igGradientColorModel.colorTopLiteral = #colorLiteral(red: 0, green: 0.8588235378, blue: 0.870588243, alpha: 1)
                                            igGradientColorModel.colorBottomLiteral = #colorLiteral(red: 0.9882352948, green: 0, blue: 1, alpha: 1)
                                            
                                        }
                                        
                                        else if customiser.title == "Pattern" {
                                            
                                            isRepeatingBitCloutBackgroundShowing = false
                                            isBigBitCloutLogoShowing = true
                                            
                                        }
                                        
                                        
                                        
                                        
                                    }, label: {
                                        Image(customiser.image3)
                                            .padding(.all, 5)
                                            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 2.0).fill(ColourDidTap3 ? Color(#colorLiteral(red: 0.3778246641, green: 0.3981202841, blue: 0.5109930038, alpha: 1)): Color(#colorLiteral(red: 0.7390274405, green: 0.7610722184, blue: 0.9567404389, alpha: 1))))
                                    })
                                    Spacer()
                                }.padding(.bottom, 50)
                                
                            }
                            
                            
                        }
                        
                        
                        
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .background(Color(#colorLiteral(red: 0.7390274405, green: 0.7610722184, blue: 0.9567404389, alpha: 1)))
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(lineWidth: 0.5).fill(Color.white))
                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.3), radius: 10, x: 0, y:10)
                    .frame(maxWidth: 320)
                    
                    
                    
                    
                    
                }.frame(maxHeight:200)
                
                
                
            }
            
        }
        .navigationBarTitle("this will be hidden")
        .navigationBarHidden(true)
        
    }
}


//MARK: - Custom Tab Indicator

//struct CustomTabIndicator: View{
//
//    var count: Int
//    @Binding var current: Int
//
//    var body: some View {
//
//        ForEach(0..<count,id: \.self) {index in
//
//            HStack {
//
//                //since image starts from 1...
//                if (current - 1) == index {
//
//                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                        Image(systemName: "paintbrush")
//                            .padding(.horizontal, 10)
//                            .foregroundColor(Color(#colorLiteral(red: 0.3814319372, green: 0.3971602917, blue: 0.508882463, alpha: 1)))
//                            .font(.system(size: 20, weight: .semibold))
//                    })
//
//                }
//                else {
//
//                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                        Image(systemName: "square.stack.3d.up")
//                            .padding(.horizontal, 10)
//                            .foregroundColor(Color(#colorLiteral(red: 0.6477008462, green: 0.6882328391, blue: 0.8909280896, alpha: 1)))
//                            .font(.system(size: 20, weight: .semibold))
//                    })
//                }
//
//            }
//
//        }
//
//
//
//
//
//
//    }
//
//
//}

struct CustomNavView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        VStack {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color(#colorLiteral(red: 0.7390274405, green: 0.7610722184, blue: 0.9567404389, alpha: 1)))
                        .font(.system(size: 30, weight: .bold))
                        .padding(.leading, 10)
                        .padding(.top, 20)
                })
                Spacer()
                
            }.padding()
            Spacer()
        }
        
    }
}


//struct NewDesignScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        NewDesignScreen()
//    }
//}

