import SwiftUI

struct SettingView: View {
    //外観モードの切り替え
    @AppStorage(wrappedValue: 0, "appearanceMode") var appearanceMode
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationView {
                Form {
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
                        Picker("外観モード", selection: $appearanceMode) {
                            Text("自動")
                                .tag(0)
                            Text("ダークモード")
                                .tag(1)
                            Text("ライトモード")
                                .tag(2)
                        }
                    } header: {
                        Text("テーマ・カラー")
                    }
                    .foregroundColor(.primary)
                }
                .navigationTitle("設定")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
