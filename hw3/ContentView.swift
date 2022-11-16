//
//  ContentView.swift
//  hw3
//
//  Created by User05 on 2022/11/9.
//

import SwiftUI

struct ContentView: View {
    init(){
            UITableView.appearance().backgroundColor = .clear
        }
    @State private var bgColor = Color.red
    @State private var isPresented = false
    @State private var presentedEye = false
    @State private var Eyes:[Eye]=[]
    var body: some View {
        NavigationView {
        VStack{
            Text("隱眼紀錄!")
            Form {
                DisclosureGroup("紀錄") {
                    ForEach(factor.indices, id: \.self) { c in
                        DisclosureGroup(factor[c]){
                            ForEach(Eyes.indices, id: \.self) { eye in
                                if(Eyes[eye].label==factor[c]){
                                    NavigationLink(
                                        destination: info(isPresented:$isPresented,eye:Eyes[eye]),
                                        label: {
                                            Text(Eyes[eye].name)
                                    })}
                            }
                        }
                    }
                }
            }.background(Image("Image").resizable().scaledToFill()
                            .frame(minWidth: 0,
                                   maxWidth: .infinity, minHeight: 0,
                                   maxHeight: .infinity)
                            )
            HStack{
                Button{
                    isPresented=true
                }label: {
                    Text("新增購買紀錄")
                        .foregroundColor(Color.white)
                }
                .fullScreenCover(isPresented: $isPresented, content:{ newBuy(isPresented:$isPresented,Eyes:$Eyes) })
                Button{
                    presentedEye=true
                }label: {
                    Text("新增心得")
                        .foregroundColor(Color.white)
                }
                .fullScreenCover(isPresented: $presentedEye, content:{ newEye(Eyes:$Eyes,presentedEye:$presentedEye) })
            }.padding(.bottom, 20.0)
        }.background(Color.gray).ignoresSafeArea()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
