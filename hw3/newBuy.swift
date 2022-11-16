//
//  newBuy.swift
//  hw3
//
//  Created by User05 on 2022/11/10.
//

import SwiftUI

struct newBuy: View {
    @Binding var isPresented :Bool
    @Binding var Eyes :[Eye]
    @State private var name = ""
    @State private var color = Color.red
    @State private var diameter = 13.5
    @State private var color_diameter = 13.1
    @State private var cost = ""
    @State private var time = Date()
    @State private var showAlert = false
    @State private var isMonthly = true
    @State private var new = false
    @State private var selectedLabel = ""
    
    var body: some View {
        VStack {
            HStack {
                Button{
                    isPresented=false
                }label: {
                    Text("back")
                }
                Spacer()
                Button{
                    if(name.isEmpty||selectedLabel.isEmpty){
                        showAlert = true
                    }
                    else{
                        add()
                        isPresented=false
                    }
                }label: {
                    Text("ok")
                }.alert(isPresented: $showAlert) { () -> Alert in
                    return Alert(title: Text("錯誤"),
                                 message:Text("名稱、廠牌不能為空")
                                 , dismissButton: .default(Text("OK"))
                    )
                }
            }
            HStack {
                if new {
                    TextField("廠牌名稱", text: $selectedLabel)
                        .overlay(textFieldBorder)
                }
                else{
                    Picker(selection: $selectedLabel, label: Text("廠牌："+selectedLabel)) {
                        ForEach(factor, id: \.self) { role in
                            Text(role)
                        }
                    }.pickerStyle(MenuPickerStyle())
                    .frame(width: 100, height: 100)
                }
                Toggle("add", isOn: $new)
            }
            TextField("系列/名稱", text: $name)
                .overlay(textFieldBorder)
            ColorPicker("color", selection: $color)
            DatePicker("買到的日期", selection: $time, in: ...Date(), displayedComponents: .date)
            Toggle(isOn: $isMonthly) {
                Text(isMonthly ? "月拋":"日拋")
            }
            Text("鏡片直徑：\(diameter, specifier: "%.1f")")
            Slider(value: $diameter, in: 10...15)
            Stepper("著色直徑：\(color_diameter, specifier: "%.1f")", value: $color_diameter, in: 10...15, step: 0.1)
            TextField("價格", text: $cost)
                .overlay(textFieldBorder)
            
        }.padding()
    }
    var textFieldBorder: some View {
        RoundedRectangle(cornerRadius: 20)
            .stroke(Color.blue, lineWidth: 1)
    }
    func add() {
        Eyes.append(Eye(color: color, name: name, message: "", label: selectedLabel, diameter: diameter, color_diameter: color_diameter, cost: Int(cost) ?? 0, time: time, isMonthly: isMonthly))
        if(new){
            factor.append(selectedLabel)
        }
    }
}
//struct newBuy_Previews: PreviewProvider {
//    static var previews: some View {
//        newBuy(isPresented: .constant(true),Eyes: [Eye(color: Color.pink,name: "對的時間點",message: "對的時間點"
//                                                      ,label: "OPT",diameter: 1.2,
//                                                      color_diameter: 20.2,cost: 3,time:Date(),isMonthly: true)])
//    }
//}
