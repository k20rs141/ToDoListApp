import SwiftUI

struct HamburgerMenu: View {
    @State private var showSettingView = false
    let screen: CGRect = UIScreen.main.bounds
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading) {
                VStack {
                   
                }
                .frame(maxWidth: .infinity, maxHeight: 20)
                .padding(.horizontal, 10)
                
                Divider()
                
                VStack {
                    Button {
                        
                    } label: {
                        Label("全てのリスト", systemImage: "list.bullet.rectangle")
                    }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 20)
                
                Divider()
                
                ScrollView (.vertical, showsIndicators: true) {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "list.bullet")
                                .foregroundColor(.primary.opacity(0.4))
                            Text("リスト")
                                .foregroundColor(.primary.opacity(0.4))
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 15)
                    .padding(.horizontal, 10)
                    
                    Divider()
                }
                .frame(maxWidth: .infinity, maxHeight: screen.height * 0.7)

                Divider()
                
                VStack(alignment: .leading) {
                    TabButton(image: "Setting")
                }
            }
            .padding(.horizontal, 20)
            .frame(width: screen.width - 90, height: screen.height)
            .background(Color("BackgroundColor"))
            Spacer(minLength: 0)
        }
    }
    
    @ViewBuilder
    func TabButton(image: String) -> some View {
        Button {
            showSettingView.toggle()
        } label: {
            Image(image)
               .resizable()
               .renderingMode(.template)
               .aspectRatio(contentMode: .fit)
               .foregroundColor(.primary)
               .frame(width: 25, height: 25)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
        .sheet(isPresented: $showSettingView) {
            SettingView()
        }
    }
}
