//
//  WriteView.swift
//  NC1Flicker
//
//  Created by Eunbi Han on 2022/05/02.
//

import SwiftUI

struct WriteView: View {
    
    var isModeOn : Bool
    var limiteTime : Int
    @State private var savedWriting = ""
    @State private var writeField = "글쓰기를 시작해보세요."
    @State private var totalLetter = 0
    
    
    var body: some View {
        NavigationView{
            VStack{
                TopToolBar(savedWriting: savedWriting)
                
                TextEditor(text: $writeField)
                    .frame(width: 340)
                    .onChange(of: writeField, perform: { value in
                        let crruntText = writeField.components(separatedBy: [" ", "\n"]).joined()
                        totalLetter = crruntText.count
                    })
                
                BottomToolBar(savedWriting: self.$savedWriting, writeField: self.$writeField, totalLetter: self.$totalLetter)
                
                
            }
            .navigationBarTitle("", displayMode: .automatic)
            .navigationBarHidden(true)
         }.navigationBarHidden(true)
        
    }
}


struct TopToolBar: View {
    var savedWriting : String
    var body: some View {
        HStack{
            NavigationLink(destination: SettingVeiw(), label: {
                Text("새 글쓰기+")
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                    .foregroundColor(Color.appMainColor)
            })
            Spacer()
            NavigationLink(destination: SaveView(savedWriting: savedWriting.trimmingCharacters(in: ["\n"])), label: {
                Text("저장한 글 보기")
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                    .foregroundColor(Color.appMainColor)
            })
        }
        .frame(width: 340)
        .padding(.top, 20)
    }
}

struct BottomToolBar: View {
    @Binding var savedWriting : String
    @Binding var writeField : String
    @Binding var totalLetter : Int
    
    var body: some View {
        HStack{
            Text("10")
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



struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView(isModeOn: true, limiteTime: 180)
    }
}