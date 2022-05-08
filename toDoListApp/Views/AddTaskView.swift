//
//  addTaskView.swift
//  toDoListApp
//
//  Created by 山田滉暁 on 2022/04/30.
//

import SwiftUI

struct AddTaskView: View {

    @Environment(\.presentationMode) var presentationMode
    
    @State var name: String = ""
    @State var priority: String = "Normal"
    
    let priorities = ["high", "normal", "low"]
    
    var body: some View {

        NavigationView {
            
            VStack {
                
                VStack(alignment: .leading, spacing: 0) {
                    
//                    HStack {
//
//                        Image(systemName: "eyedropper")
//
//                        let colors: [String] = ["orange","red","purple","blue","green","yellow"]
//
//                        HStack (spacing: 15) {
//                            ForEach(colors,id: \.self) { color in
//                                Circle()
//                                    .fill(Color(color))
//                                    .frame(width: 25, height: 25)
//                                    .background(
//                                        taskModel.taskColor == color {
//                                            Circle()
//                                                .strokeBorder(.gray)
//                                                .padding(-3)
//                                        }
//                                    )
//                                    .contentShape(Circle())
//                                    .onTapGesture {
//                                        taskModel.taskColor = color
//                                    }
//                            }
//                        }
//                    }
                    
                    Form {
                        //リストの名前
                        TextField("リスト", text: $name)
                        
                        //選択ボタン
                        Picker("Priority", selection: $priority) {
                            ForEach(priorities, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        

                    }
                }
            }
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    //保存ボタン
                    Button {
                        print("保存されました。")
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("追加")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("キャンセル")
                    }
                }
            }
            .navigationTitle("新規タスク")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}

