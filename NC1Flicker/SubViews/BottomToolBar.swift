//
//  BottomToolBar.swift
//  NC1Flicker
//
//  Created by Eunbi Han on 2022/05/04.
//

import SwiftUI

struct BottomToolBar: View {
    @Binding var savedWriting : String
    @Binding var writeField : String
    @Binding var totalLetter : Int
    @Binding var time : Int
    @State private var timeCount = 0
    var limiteTime: Int
    @State var showAlert = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack{
            if (isModeOn) {
                Text("\(time)")
                    .onReceive(timer){ _ in
                        if(time>0){
                            time -= 1
                        }
                        if(time==0 && isModeOn){
                            writeField = ""
                        }
                        if (timeCount < limiteTime){
                            timeCount += 1
                        }
                        if(time == 0){
                            time = 10
                            showAlert = true
                        }
                    }
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .frame(width: 33, height: 33)
                    .background(Color.appMainColor)
                    .clipShape(Circle())
            }
//            Alert(Text("test"), isPresented: $test1, actions: {
//                if (time==0){
//                    test1 = true
//                }
//            })
            
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
                if (limiteTime==0 || timeCount == limiteTime){
                    Text("저장")
                        .font(.system(size: 16))
                        .foregroundColor(.appMainColor)
                }else{
                    Text("저장")
                        .font(.system(size: 16))
                        .foregroundColor(.textSubColor)
                }
                
            }
        }
        .alert("시간 초과🥲", isPresented: $showAlert, actions: {})
        .frame(width: 340)
        .padding(.bottom, 10)
        
    }
}
struct countNumberOfWriting : View {
    var totalLetter: Int
    var body: some View {
        Text("공미포 \(totalLetter)자")
            .font(.system(size: 10))
            .foregroundColor(.textSubColor)
    }
}
