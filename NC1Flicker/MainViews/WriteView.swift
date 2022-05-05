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
                Button(action: {
                    showWriteModal = false
                }, label: {
                    Text("설정")
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                        .foregroundColor(Color.appMainColor)
                })
                Spacer()
                Button(action: {
                    showSaveModal = true
                }, label: {
                    Text("저장글")
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                        .foregroundColor(Color.appMainColor)
                })
            }
            .frame(width: 340)
            .padding(.top)
            
            TextEditorView(writeField: self.$writeField, totalLetter: self.$totalLetter, currentSec: $currentSec)
            
            //BottomToolBar(savedWriting: self.$savedWriting, writeField: self.$writeField, totalLetter: self.$totalLetter, time: $currentSec, limiteTime: limiteTime)
            HStack{
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
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .frame(width: 33, height: 33)
                    .background(Color.appMainColor)
                    .clipShape(Circle())
                
                Spacer()
                countNumberOfWriting(totalLetter: totalLetter)
                Spacer()
                
                Button(action: {
                    if (limiteTime==0 || timeCount == limiteTime){
                        savedWriting += "\n" + writeField
                        writeField = ""
                        timeCount = 0
                    }
                }){
                    Text("저장")
                        .font(.system(size: 16))
                        .foregroundColor(.appMainColor)
                }
            }
            .alert("시간 초과🥲", isPresented: $showAlert, actions: {}){}
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
