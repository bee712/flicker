//
//  SaveView.swift
//  NC1Flicker
//
//  Created by Eunbi Han on 2022/05/03.
//

import SwiftUI

struct SaveView: View {
    var savedWriting : String
    @State var writeField = "글쓰기를 시작해보세요."
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{     // 글쓰기 뷰 상단
                    Text("복사")
                        .font(.system(size: 16))
                        .foregroundColor(.appMainColor)
                        
                    Spacer()
                    Text("공미포 0,000자")
                        .font(.system(size: 10))
                        .foregroundColor(Color("textSubColor"))
                    Spacer()
                    Button(action: {
                        
                    }){
                        Text("수정")
                            .font(.system(size: 16))
                            .foregroundColor(.appMainColor)
                    }
                }.frame(width: 340)
                
                TextEditor(text: $writeField)
                    .frame(width: 340, height: 632)
                
                // TextField
                HStack{     // 뷰 하단 네비게이션
                    NavigationLink(destination: SettingVeiw(), label: {
                        Text("새 글쓰기+")
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                            .foregroundColor(Color.appMainColor)
                    })
                    Spacer()
                    
                    
                }
                .frame(width: 340)
            }.navigationBarTitle("", displayMode: .automatic)
                .navigationBarHidden(true)
        }.navigationBarHidden(true)
    }
}

struct SaveView_Previews: PreviewProvider {
    static var previews: some View {
        SaveView(savedWriting: "저장된 글 입니다.")
    }
}
