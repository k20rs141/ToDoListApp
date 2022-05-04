//
//  HomeView.swift
//  toDoListApp
//
//  Created by 山田滉暁 on 2022/04/30.
//

import SwiftUI

struct HomeView: View {
    @State private var offset = CGFloat.zero
    @State private var closeOffset = CGFloat.zero
    @State private var openOffset = CGFloat.zero
    
    @State var showEditView = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                NavigationView {
                    ZStack {
                        VStack {
                            
                            Text("hello world")
                            Text("hello world")
                            
                            Spacer()
                            
                            AddTaskButton()
                        }
//                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                        .background(Color.gray.opacity(Double(0.3)))
                        Color.gray.opacity(
                            Double((self.closeOffset - self.offset) / self.closeOffset) - 0.4
                        )
                    }
                    
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                self.offset = self.openOffset
                            }) {
                                Image(systemName: "line.horizontal.3")
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Menu {
                                EditButton()
                            } label: {
                                Label("Edit", systemImage: "ellipsis")
                                    .rotationEffect(.degrees(90))
                            }
                        }
                        
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .background(Color.gray.opacity(0.1))
//                    .edgesIgnoringSafeArea(.bottom)
                    .frame(maxWidth: .infinity, maxHeight: 700)
//                    .edgesIgnoringSafeArea(.vertical)
                }
                
                MenuView()
                    .background(Color.white)
                    .frame(width: geometry.size.width * 0.82)
                    .edgesIgnoringSafeArea(.bottom)
                    .onAppear(perform: {
                        self.offset = geometry.size.width * -1
                        self.closeOffset = self.offset
                        self.openOffset = .zero
                    })
                    .offset(x: self.offset)
                    
                    .animation(.default, value: self.offset)
                
                
            }
            
            .gesture(DragGesture(minimumDistance: 5)
                .onChanged { value in
                    if (self.offset < self.openOffset) {
                        self.offset = self.closeOffset + value.translation.width
                    }
                }
                .onEnded { value in
                    if (value.location.x > value.startLocation.x) {
                        self.offset = self.openOffset
                    }
                    else {
                        self.offset = self.closeOffset
                   }
                }
            )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct EditButton: View {
    @State var showEditView = false
    @State var showAlert = false
    var body: some View {
        Button(role: .none, action: {
//            showSheet = .add
            self.showEditView.toggle()
            
        }) {
            Label("リストの編集",systemImage: "pencil")
        }
//            Button(action: {self.showAlert.toggle()}) {
//                    Label("リストの削除",systemImage: "trash.fill")
//            }
//            .alert("アラート表示", isPresented: $showAlert) {
//                Button("破壊的", role: .destructive) {
//                    print("破壊的ボタンが押された!")
//                }
//                Button("キャンセル", role: .cancel) {
//                    print("cacelボタンが押された!")
//                }
//            }
    }
}


struct ModalView: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView {
            HStack {
                Text("second view")
            }
            .navigationBarItems(leading: Button(action: {
                self.presentation.wrappedValue.dismiss()
            }) {
                Text("閉じる")
            })
        }
    }
}

struct MenuView: View {

    @State var showSettingView = false
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                
                VStack {
                    Spacer()
                }
                .frame(width: .infinity, height: 10)
                
                Divider()
                
                VStack {
                    Button {
                        
                    } label: {
                        Label("全てのリスト", systemImage: "list.bullet.rectangle")
                    }
                }
                .padding(.horizontal, 40)
                .padding(.vertical, 25)
                
                Divider()
                
                ScrollView (.vertical, showsIndicators: true) {
                    
                    VStack(alignment: .leading) {
                        
                        HStack {
                            Image(systemName: "list.bullet")
                                .foregroundColor(.primary.opacity(0.4))
                            Text("リスト")
                                .foregroundColor(.primary.opacity(0.4))
                        }
                        HStack {
                            
                        }
                        HStack {
                            
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 15)
                }
                .frame(maxWidth: .infinity, maxHeight: 600)

                VStack(alignment: .leading, spacing: 20) {
                    
                    Divider()
                    
                    TabButton(image: "Setting")

                }
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .leading)
        }
    }
    @ViewBuilder
    func TabButton(image: String) -> some View {
//        NavigationLink(destination: SettingView()) {
//
//            HStack {
//                Image(image)
//                        .resizable()
//                        .renderingMode(.template)
//                        .aspectRatio(contentMode: .fill)
//                        .foregroundColor(.primary)
//                        .frame(width: 22, height: 22)
//            }
//        }
        
        Button {
            showSettingView.toggle()
        } label: {
            Image(image)
               .resizable()
               .renderingMode(.template)
               .aspectRatio(contentMode: .fill)
               .foregroundColor(.primary)
               .frame(width: 25, height: 25)
        }
        .padding(.horizontal, 10)
        .padding(.bottom, 0)
        .sheet(isPresented: $showSettingView) {
            SettingView()
        }
    }
}

struct AddTaskButton: View {
    @State private var showAddTaskView = false
    
    var body: some View {
        ZStack {
            Button {
                showAddTaskView.toggle()
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .shadow(color: .black, radius: 30, x: 10, y: 10)
            }
            .background(
                Color(red: 0.133, green: 0.537, blue: 0.898)
                    .cornerRadius(50)
                    .frame(width: 80, height: 80)
            )
            .sheet(isPresented: $showAddTaskView) {
                addTaskView()
//                Text("success")
            }
            .padding(.trailing, 40)
            .padding(.bottom, 10)
        }
        .frame(maxWidth: .infinity,alignment: .trailing)
        .padding()
    }
}

//struct SettingView: View {
//    var body: some View {
//            
//        VStack(spacing: 30) {
//            VStack {
//                Text("設定")
//                    .font(.largeTitle)
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
//        .background(
//            Color(red: 0.965, green: 0.965, blue: 0.965)
//        )
//    }
//}
