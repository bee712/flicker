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
    @State private var currentSec : Int = 10
    
    @ObservedObject var myTimer = MyTimer()
    
    var body: some View {
        HStack{
            Text("\(self.myTimer.value)")
                .font(.system(size: 16))
                .foregroundColor(.white)
                .frame(width: 33, height: 33)
                .background(Color.appMainColor)
                .clipShape(Circle())
                
            Spacer()
            Text("공미포 \(totalLetter)자")
                .font(.system(size: 10))
                .foregroundColor(Color("textSubColor"))
            Spacer()
            Button(action: {
                savedWriting += "\n" + writeField
                writeField = ""
            }){
                Text("저장")
                    .font(.system(size: 16))
                    .foregroundColor(Color("textSubColor"))
            }
        }
        .frame(width: 340)
        .padding(.bottom, 10)
    }
}
