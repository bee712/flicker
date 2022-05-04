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
    @State var writeField = "글쓰기를 시작해보세요."
    @State var totalLetter = 0
    @State var savedWriting = ""
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{     // 뷰 하단 네비게이션
                    NavigationLink(destination: SaveView(savedWriting: savedWriting.trimmingCharacters(in: ["\n"])), label: {
                        Text("저장한 글 보기")
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                            .foregroundColor(Color.appMainColor)
                    })
                    Spacer()
                    NavigationLink(destination: SettingVeiw(), label: {
                        Text("새 글쓰기+")
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                            .foregroundColor(Color.appMainColor)
                    })
                    
                }
                .frame(width: 340)
                .padding(.top, 20)
                
                TextEditor(text: $writeField)
                    .frame(width: 340)
                    .onChange(of: writeField, perform: { value in
                        let crruntText = writeField.components(separatedBy: [" ", "\n"]).joined()
                        
                        totalLetter = crruntText.count
                        
                    })
                
                HStack{     // 글쓰기 뷰 상단
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
            .navigationBarTitle("", displayMode: .automatic)
            .navigationBarHidden(true)
         }.navigationBarHidden(true)
        
    }
}



struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView(isModeOn: true, limiteTime: 180)
    }
}
