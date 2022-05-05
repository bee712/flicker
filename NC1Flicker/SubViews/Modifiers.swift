//
//  Views.swift
//  NC1Flicker
//
//  Created by Eunbi Han on 2022/05/05.
//

import SwiftUI

struct TextModifier : ViewModifier {
    var customColor: Color = .textMainColor
    var customSize: CGFloat = 16
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: customSize))
            .foregroundColor(customColor)
    }
}

struct AddAlert: ViewModifier {
    var alertText: String
    @Binding var isShow: Bool
    func body(content: Content) -> some View {
        content
            .alert(alertText, isPresented: $isShow,actions: {}){}
    }
}

