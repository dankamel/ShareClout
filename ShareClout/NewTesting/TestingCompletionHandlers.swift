////
////  TestingCompletionHandlers.swift
////  ShareClout
////
////  Created by Daniel Kamel on 07/09/2021.
////
//
//import SwiftUI
//
//func sampleFunction1(completion: @escaping () -> Void) {
//    
//    let biggie = Clout()
//    print(biggie)
//    completion()
//    
//}
//
////func sampleFunction2(completion: @escaping () -> Void) {
////
////    let bestie = fetchResults.getData()
////
////    print(bestie)
////}
//
//func sampleFunction3(completion: @escaping () -> Void) {
//    
//    let fetchie = fetchResults().getData { clout in
//        
//        
//        
//    }
//    
//    print(fetchie)
//    completion()
//    
//}
//
////func sampleFunction4(completion: @escaping () -> Void) {
////    
////    let fetchMe = fetchResults()
////    init() {
////        
////        fetchMe.getData { Cloutington in
////            Cloutington
////        }
////        
////    }
////    
////}
////
//
//
//struct TestingCompletionHandlers: View {
//    
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).onAppear() {
//            
//            sampleFunction3(completion: {
//                
//                print("hey bestie")
//                
//            })
//            
//        }
//        
//    }
//}
//
//struct TestingCompletionHandlers_Previews: PreviewProvider {
//    static var previews: some View {
//        TestingCompletionHandlers()
//    }
//}
//
///*
// 
// Here is what I need to do
// 
//testFunc(completion: @escaping () -> Void) {
// 
//    call and fire off fetchResults.getData... maybe it's just fetchResults()
//    completion()
// 
// 
// }
// 
// testFunc {
// 
//    execute snapshot
// 
// }
// 
// 
// 
// 
// 
// 
// */
