//
//  Exchange.swift
//  ShareClout
//
//  Created by Daniel Kamel on 19/08/2021.
//

import Foundation

struct Exchange: Decodable, Hashable {
    
    var BuyBitCloutFeeBasisPoints: Int?
    var NanosSold: Int?
    var SatoshisPerBitCloutExchangeRate: Int?
    var USDCentsPerBitCloutExchangeRate: Int?
    var USDCentsPerBitCloutReserveExchangeRate: Int?
    var USDCentsPerBitcoinExchangeRate: Int?
    
}
