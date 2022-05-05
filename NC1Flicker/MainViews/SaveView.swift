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
    @Binding var showSaveModal: Bool
    let alertInfo = ["복사", "복사 완료", "클립보드로 복사되었습니다."]
    
    
    var body: some View {
            VStack{
                HStack{
                    ModalUpDownButton(showModal: $showSaveModal, buttonName: "닫기")
                    Spacer()
                }
                .frame(width: 340)
                .padding(.top)
                
                TextEditorView(writeField: self.$savedWriting, totalLetter: self.$totalLetter, currentSec: $time)
                
                HStack{
                    Text("  ")
                    Spacer()
                    countNumberOfWriting(totalLetter: totalLetter)
                    Spacer()
                    Button(action: {
                        let pasteboard = UIPasteboard.general
                        pasteboard.string = savedWriting
                        showAlert = true
                    }){
                        Text(alertInfo[0])
                            .modifier(TextModifier(customColor: .appMainColor, customSize: 16))
                    }
                    .modifier(AddAlert(alertText: "복사 완료", isShow: $showAlert))
                }
                .frame(width: 340)
                .padding(.bottom, 10)
                
            }
    }
}

struct SaveView_Previews: PreviewProvider {
    @State static var showModal = true
    static var previews: some View {
        SaveView(savedWriting: "저장된 글",showSaveModal: $showModal)
    }
}
