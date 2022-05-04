//
//  Timer.swift
//  NC1Flicker
//
//  Created by Eunbi Han on 2022/05/04.
//

import SwiftUI
import Combine
 
class MyTimer: ObservableObject {
    @Published var value: Int = 10
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.value -= 1
            if (self.value == -1){
                self.value = 10
            }
            
        }
    }
}
