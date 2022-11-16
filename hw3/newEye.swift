//
//  newEye.swift
//  hw3
//
//  Created by User05 on 2022/11/9.
//

import SwiftUI

struct newEye: View {
    @State private var message = ""
    @State private var select = -1
    @State private var showAlert = false
    @Binding var Eyes :[Eye]
    @Binding var presentedEye:Bool
    var body: some View {
        VStack {
            Button{
                presentedEye=false
            }label: {
                Text("back")
            }
            
            Picker(selection: $select, label: Text("選擇")) {
                ForEach(Eyes.indices, id: \.self) { eye in
                    Text(Eyes[eye].label+"  "+Eyes[eye].name)
                }
            }
            TextEditor(text: $message)
                .frame(width: 300, height: 100)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 8))
            
            Button{
                if(message.isEmpty||select == -1){
                    showAlert = true
                    presentedEye=true
                }
                else{
                    self.Eyes[select].message=message
                    presentedEye=false
                }
            }label: {
                Text("ok")
            }.alert(isPresented: $showAlert) { () -> Alert in
                return Alert(title: Text("錯誤"),
                             message:Text("不能為空")
                             , dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

//struct newEye_Previews: PreviewProvider {
//    @State private var Eyes:[Eye]=[]
//    @State private var presentedEye = false
//    static var previews: some View {
//        newEye(Eyes: $Eyes,presentedEye:$presentedEye)
//    }
//}
