//
//  Views.swift
//  NC1Flicker
//
//  Created by Eunbi Han on 2022/05/05.
//

import SwiftUI

struct countNumberOfWriting : View {

    var totalLetter: Int
    var body: some View {
        Text("공미포 \(totalLetter)자")
            .font(.system(size: 10))
            .foregroundColor(.textSubColor)
    }
}

struct TextModifier : ViewModifier {
    var customColor: Color = .textMainColor
    var customSize: CGFloat = 16
    
    func body(content: Content) -> some View {
            content
            .font(.system(size: customSize))
            .foregroundColor(customColor)
        }
}
