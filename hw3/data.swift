//
//  data.swift
//  hw3
//
//  Created by User05 on 2022/11/9.
//

import SwiftUI
import Foundation
struct Eye{
    let color         :Color
    let name          :String
    var message       :String
    let label         :String
    let diameter      :Double
    let color_diameter:Double
    let cost          :Int
    let time          :Date
    let isMonthly     :Bool
}
var COLOR:[Color]=[Color.white]
var factor:[String]=["帝康","OPT","海昌","ilens","博士倫","星眸","綺芙莉"]
extension Eye {
    static let demo = Eye(color: Color.pink,name: "對的時間點",message: "對的時間點"
                          ,label: "OPT",diameter: 1.2,
                          color_diameter: 20.2,cost: 3,time:Date(),isMonthly: true)
}
let lucky:[String]=["大吉","吉吉復吉吉","吉","大吉大利","吉娃娃"]
