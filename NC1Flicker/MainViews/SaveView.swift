//
//  SaveView.swift
//  NC1Flicker
//
//  Created by Eunbi Han on 2022/05/03.
//

import SwiftUI

struct SaveView: View {
    @State var savedWriting : String
    @State var totalLetter: Int = 0
    @State var time = 10
    @State var showAlert: Bool = false
    let alertInfo = ["복사", "복사 완료", "클립보드로 복사되었습니다."]
    
    
    var body: some View {
        NavigationView{
            VStack{
                
                TopToolBar(savedWriting: savedWriting, isSaveViewShow: false)
                
                TextEditorView(writeField: self.$savedWriting, totalLetter: self.$totalLetter, currentSec: $time)
                
                HStack{
                    Text("  ")
                        
                    Spacer()
                    Text("공미포 \(totalLetter)자")
                        .font(.system(size: 10))
                        .foregroundColor(Color("textSubColor"))
                    Spacer()
                    Button(action: {
                        let pasteboard = UIPasteboard.general
                        pasteboard.string = savedWriting
                        showAlert = true
                    }){
                        Text(alertInfo[0])
                            .font(.system(size: 16))
                            .foregroundColor(.appMainColor)
                    }
                    .alert(isPresented: $showAlert){
                        Alert(title: Text(alertInfo[1]), message: Text(alertInfo[2]))
                    }
                }
                .frame(width: 340)
                .padding(.bottom, 10)
                
            }.navigationBarTitle("", displayMode: .automatic)
                .navigationBarHidden(true)
        }.navigationBarHidden(true)
    }
}

struct SaveView_Previews: PreviewProvider {
    static var previews: some View {
        SaveView(savedWriting: "저장된 글")
    }
}
