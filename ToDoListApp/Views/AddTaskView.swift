import SwiftUI

struct AddTaskView: View {
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.dismiss) private var dismiss
    @State private var name: String = ""
    @State private var priority: String = "なし"
    @State private var errorShow: Bool = false
    let priorities = ["低", "中", "高"]
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 0) {
                    Form {
                        Section {
                            //リストの名前
                            HStack {
                                TextField("リスト", text: $name)
                            }
                            //選択ボタン
                            HStack {
                                Picker(selection: $priority, label: Text("優先順位")) {
                                    ForEach(priorities, id: \.self) {
                                        Text($0)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    //保存ボタン
                    Button(action: {
                        addTask()
                    }) {
                        Image(systemName: "plus")
                    }
                    .alert("リストが入力されていません", isPresented: $errorShow) {
                        Button("了解") {
                            
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
            .navigationTitle("新規タスク")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func addTask() {
        if self.name != "" {
            // 新規レコードの作成
            let task = Task(context: self.viewContext)
            task.name = self.name
            task.priority = self.priority
            // データベースへ保存
            do {
                try self.viewContext.save()
            } catch {
                print(error)
            }
        } else {
            self.errorShow = true
            return
        }
        dismiss()
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}

