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
                TopToolBar(savedWriting: savedWriting, isSaveViewShow: true)
                
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



struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView(isModeOn: true, limiteTime: 180)
    }
}
