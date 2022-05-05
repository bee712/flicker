//
//  TextEditorView.swift
//  NC1Flicker
//
//  Created by Eunbi Han on 2022/05/04.
//

import SwiftUI

struct TextEditorView: View {
    @Binding var writeField : String
    @Binding var totalLetter : Int
    @Binding var time : Int
    
    var body: some View {
        TextEditor(text: $writeField)
            .frame(width: 340)
            .onChange(of: writeField, perform: { value in
                let crruntText = writeField.components(separatedBy: [" ", "\n"]).joined()
                totalLetter = crruntText.count
                if(writeField != ""){
                    time = 10
                }
            })
    }
}
