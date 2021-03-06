//
//  SettingVeiw.swift
//  NC1Flicker
//
//  Created by Eunbi Han on 2022/05/01.
//

import SwiftUI

var isModeOn: Bool = true

struct SettingVeiw: View {
    
    let modeNames = ["ON", "OFF"]
    @State private var selectedMode = 0
    @State private var timeLimitSec = 0
    @State private var isTimeModeOn = true
    @State private var showWriteModal = false
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.appMainColor)
        UISegmentedControl.appearance().backgroundColor = UIColor(Color.buttonSubColor)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.textSubColor)], for: .normal)
    }
    
    var body: some View {
            VStack{
                Spacer()
                VStack{
                    Text("시간 제한 기능을 켤까요?")
                        .fontWeight(.semibold)
                        .modifier(TextModifier(customSize: 30))
                    
                    Picker("OnOffPicker", selection: $selectedMode) {
                        ForEach(0..<modeNames.count) { index  in
                            Text(modeNames[index])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 150, height: 52)
                    .scaledToFit()
                    .scaleEffect(CGSize(width: 1.5, height: 1.5))
                    .onChange(of: selectedMode, perform: { value in
                        if(selectedMode==0){
                            isModeOn = true
                        }else{
                            isModeOn = false
                        }
                    })
                    
                }
                .padding(.bottom, 90)
                
                VStack{
                    Text("저장 버튼을\n몇 초마다 활성화할까요?")
                        .fontWeight(.semibold)
                        .modifier(TextModifier(customSize: 30))
                        .multilineTextAlignment(.center)
                    
                    HStack{
                        // - 버튼
                        Button(action: {
                            if(timeLimitSec>0){timeLimitSec -= 15}
                        }, label: {
                            Text("-")
                                .font(.system(size: 36))
                                .fontWeight(.semibold)
                                .frame(width: 60, height: 60)
                                .foregroundColor(Color.appMainColor)
                                .background(Color.buttonSubColor)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.appMainColor, lineWidth: 1))
                        })
                        // 제한 시간 표시 버튼
                        Button(action: {
                        }, label: {
                            Text("\(timeLimitSec)")
                                .font(.system(size: 36))
                                .fontWeight(.semibold)
                                .frame(width: 80, height: 80)
                                .foregroundColor(Color.white)
                                .background(Color.appMainColor)
                                .clipShape(Circle())
                                .overlay(Circle()
                                    .stroke(Color.white, lineWidth: 3)
                                    .shadow(color: Color.buttonInnerShadow1, radius: 2, x: 3, y: 3)
                                    .clipShape(Circle())
                                    .shadow(color: Color.buttonInnerShadow2, radius: 2, x: -3, y: -3)
                                    .clipShape(Circle())
                                )
                        }).padding([.leading, .trailing])
                        // + 버튼
                        Button(action: {
                            timeLimitSec += 15
                        }, label: {
                            Text("+")
                                .font(.system(size: 36))
                                .fontWeight(.semibold)
                                .frame(width: 60, height: 60)
                                .foregroundColor(Color.appMainColor)
                                .background(Color.buttonSubColor)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.appMainColor, lineWidth: 1))
                        })
                    }
                    
                }
                Spacer()
                
                Button(action: {
                    showWriteModal = true
                }, label: {
                    Text("글쓰기 시작")
                        .fontWeight(.semibold)
                        .modifier(TextModifier(customColor: .white, customSize: 24))
                        .frame(width: 212, height: 47)
                        .background(Color.appMainColor)
                        .cornerRadius(24)
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(Color.white, lineWidth: 3)
                                .shadow(color: Color.buttonInnerShadow1, radius: 2, x: 3, y: 3)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(color: Color.buttonInnerShadow2, radius: 2, x: -3, y: -3)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    )
                })
                .padding(.bottom, 30)
                
                
            }
            .fullScreenCover(isPresented: $showWriteModal){
                WriteView(selectedMode: selectedMode, limiteTime: timeLimitSec, showSaveModal: $showWriteModal)
            }

        
        
    }
}


extension Color{
    static let appMainColor = Color("appMainColor")
    static let buttonInnerShadow1 = Color("buttonInnerShadow1")
    static let buttonInnerShadow2 = Color("buttonInnerShadow2")
    static let buttonSubColor = Color("buttonSubColor")
    static let textMainColor = Color("textMainColor")
    static let textSubColor = Color("textSubColor")
}

struct SettingVeiw_Previews: PreviewProvider {
    static var previews: some View {
        SettingVeiw()
    }
}
