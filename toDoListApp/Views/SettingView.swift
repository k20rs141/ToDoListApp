//
//  SettingView.swift
//  toDoListApp
//
//  Created by 山田滉暁 on 2022/05/04.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        VStack(spacing: 0) {
            
            VStack {
                Text("設定")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity, maxHeight: 40, alignment: .leading)
            .padding(.top, 80)
            .padding(.horizontal, 30)
            
            NavigationView {
                List {
                    Section {
                        Text("外観モード")
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
                        Text("外観モード")
                    } header: {
                        Text("テーマ・カラー")
                    }
                    .foregroundColor(.primary)
                }
                .listStyle(.insetGrouped)
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
