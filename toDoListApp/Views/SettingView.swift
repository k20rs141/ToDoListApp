//
//  SettingView.swift
//  toDoListApp
//
//  Created by 山田滉暁 on 2022/05/04.
//

import SwiftUI

struct SettingView: View {
    //NightModeの切り替え
    @State private var nightMode = false
    
    var body: some View {
        VStack(spacing: 0) {
            
            VStack {
                Text("設定")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity, maxHeight: 60, alignment: .leading)
            .padding(.top, 50)
            .padding(.horizontal, 30)
            
            NavigationView {

                VStack {
                    
                    List {
                       
                        Section {
                            Text("アカウント")
                            Text("通知")
                        } header: {
                            Text("ユーザー")
                        }
                        .foregroundColor(.primary)
                        
                        Section {
                            Text("利用規約")
                            Text("プライバシーポリシー")
                            Text("お問い合わせ")
                            Text("FAQ")
                        } header: {
                            Text("アプリ情報")
                        }
                        .foregroundColor(.primary)
                        
                        Section {
                            Text("文字サイズ")
                            Text("リスト色")
                            
                            Toggle(isOn: $nightMode) {
                                Text("ナイトモード")
                            }
                        } header: {
                            Text("テーマ・カラー")
                        }
                        .foregroundColor(.primary)
                    }
                    .listStyle(.insetGrouped)
                }
                .frame(height: 750)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(
            Color(red: 0.955, green: 0.955, blue: 0.955)
        )
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
