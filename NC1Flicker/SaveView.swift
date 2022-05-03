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
    @State var showAlert: Bool = false
    
    
    var body: some View {
        NavigationView{
            VStack{
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
                        Text("복사")
                            .font(.system(size: 16))
                            .foregroundColor(.appMainColor)
                    }
                    .alert(isPresented: $showAlert){
                        Alert(title: Text("타이틀 뭐라쓰지~~"), message: Text("클립보드로 복사되었습니다."))
                    }
                }.frame(width: 340)
                
                TextEditor(text: $savedWriting)
                    .frame(width: 340, height: 632)
                    .onChange(of: savedWriting, perform: { value in
                        let crruntText = savedWriting.components(separatedBy: [" ", "\n"]).joined()
                        totalLetter = crruntText.count
                        
                    })
                
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
        SaveView(savedWriting: "저장된 글")
    }
}
