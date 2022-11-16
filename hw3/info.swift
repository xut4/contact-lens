//
//  info.swift
//  hw3
//
//  Created by User05 on 2022/11/14.
//

import SwiftUI

struct info: View {
    @Binding var isPresented :Bool
    let eye:Eye
    var body: some View {
        NavigationView {
            ZStack{
                Color.gray.edgesIgnoringSafeArea(.all)
            VStack {
                List{
                    Text("廠牌：\(eye.label)")
                    Text("系列/名稱：\(eye.name)")
                    Text("著色直徑：\(eye.color_diameter, specifier: "%.1f")")
                    Text("鏡片直徑：\(eye.diameter, specifier: "%.1f")")
                    Text("價格：\(eye.cost)")
                    Text("買到日期：\(eye.time)")
                    HStack{
                    Text("顏色：")
                        Circle().foregroundColor(eye.color)
                    }
                    Text(eye.isMonthly ? "月拋":"日拋")
                Text(eye.message)
                    .font(.subheadline)
                    .fontWeight(.heavy)
                }
                Text("今日運勢："+lucky[Int.random(in: 0...4)])
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(Color.pink)
            }
            }
        }.navigationBarTitle(eye.label+"  "+eye.name)
        
    }
}

struct info_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        info(isPresented: .constant(true), eye: Eye(color: Color.pink,name: "對的時間點",message: "對的時間點對的時間點對的時間點對的時間點對的時間點對的時間點對的時間點對的時間點"
                                                    ,label: "OPT",diameter: 1.2,
                                                    color_diameter: 20.2,cost: 3,time:Date(),isMonthly: true))
    }
    }
}
