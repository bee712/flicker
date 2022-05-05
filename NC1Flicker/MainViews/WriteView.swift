//
//  WriteView.swift
//  NC1Flicker
//
//  Created by Eunbi Han on 2022/05/02.
//

import SwiftUI

struct WriteView: View {
    
    var selectedMode : Int
    var limiteTime : Int
    @Binding var showWriteModal: Bool
    
    @State private var savedWriting = ""
    @State private var writeField = "글쓰기를 시작해보세요."
    @State private var totalLetter = 0
    @State private var currentSec = 10
    @State private var showSaveModal = false
    @State private var timeCount = 0
    @State private var showAlert = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    init(selectedMode : Int, limiteTime : Int, showSaveModal: Binding<Bool>){
        self.selectedMode = selectedMode
        self.limiteTime = limiteTime
        self._showWriteModal = showSaveModal
        if (self.selectedMode==0) {
            isModeOn = true
        }else{
            isModeOn = false
        }
    }
    
    
    var body: some View {
        VStack{
            HStack{
                ModalUpDownButton(showModal: $showWriteModal, buttonName: "설정")
                Spacer()
                ModalUpDownButton(showModal: $showSaveModal, buttonName: "저장글")
            }
            .frame(width: 340)
            .padding(.top)
            
            TextEditorView(writeField: self.$writeField, totalLetter: self.$totalLetter, currentSec: $currentSec)
            
            HStack{
                // 남은 시간 초를 표시해주는 텍스트
                Text("\(currentSec)")
                    .onReceive(timer){ _ in
                        if(currentSec>0 && showSaveModal==false){
                            currentSec -= 1
                        }
                        if(currentSec==0 && isModeOn){
                            writeField = ""
                        }
                        if (timeCount < limiteTime){
                            timeCount += 1
                        }
                        if(currentSec == 0){
                            currentSec = 10
                            if(showSaveModal==false){
                                showAlert = true
                            }
                        }
                    }
                    .modifier(TextModifier(customColor: .white, customSize: 16))
                    .frame(width: 33, height: 33)
                    .background(Color.appMainColor)
                    .clipShape(Circle())
                
                Spacer()
                
                countNumberOfWriting(totalLetter: totalLetter)
                
                Spacer()
                
                if (limiteTime != timeCount){
                    Text("저장")
                        .modifier(TextModifier(customColor: .textSubColor, customSize: 16))
                }else{
                    Text("저장")
                        .modifier(TextModifier(customColor: .appMainColor, customSize: 16))
                        .onTapGesture {
                            if (limiteTime==0 || timeCount == limiteTime){
                                savedWriting += "\n" + writeField
                                writeField = ""
                                timeCount = 0
                            }
                        }
                }
                
            }
            .modifier(AddAlert(alertText: "시간 초과🥲", isShow: $showAlert))
            .frame(width: 340)
            .padding(.bottom, 10)
            
        }
        .fullScreenCover(isPresented: $showSaveModal){
            SaveView(savedWriting: savedWriting.trimmingCharacters(in: ["\n"]), showSaveModal: $showSaveModal)
        }
        
    }
}


struct WriteView_Previews: PreviewProvider {
    @State static var aaa: Bool = true
    static var previews: some View {
        WriteView(selectedMode: 1, limiteTime: 30, showSaveModal: $aaa)
    }
}
