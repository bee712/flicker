//
//  TopToolBar.swift
//  NC1Flicker
//
//  Created by Eunbi Han on 2022/05/04.
//
import SwiftUI

struct TopToolBar: View {
    var savedWriting : String
    var isSaveViewShow : Bool
    
    var body: some View {
        HStack{
            if isSaveViewShow {
                NavigationLink(destination: SaveView(savedWriting: savedWriting.trimmingCharacters(in: ["\n"])), label: {
                    Text("저장한 글 보기")
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                        .foregroundColor(Color.appMainColor)
                })
            }
            Spacer()
            NavigationLink(destination: SettingVeiw(), label: {
                Text("새 글쓰기+")
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                    .foregroundColor(Color.appMainColor)
            })
        }
        .frame(width: 340)
        .padding(.top)
    }
}

