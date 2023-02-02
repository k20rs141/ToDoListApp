import SwiftUI

struct KebabMenu: View {
    //データの取得
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Task.name, ascending: true)], animation: .easeInOut) var tasks: FetchedResults<Task>
    
    @Environment(\.managedObjectContext) var viewContext
    @State private var showEdit = false
    @State private var showAlert = false
    
    var body: some View {
        VStack  {
            Menu {
                Button {
                    self.showEdit.toggle()
                } label: {
                    Label("リストを編集", systemImage: "pencil")
                }
                
                Button(role: .destructive) {
                    self.showAlert.toggle()
                } label: {
                    Label("リストを削除", systemImage: "trash")
                }
            } label: {
                Image(systemName: "ellipsis")
                    .rotationEffect(.degrees(90))
            }
        }
        .sheet(isPresented: $showEdit) {
            EditTaskView()
        }
        .alert("このリストを削除しますか？", isPresented: $showAlert) {
            Button("削除", role: .destructive) {
                
            }
        } message: {
           Text("この操作によりリストが削除されます。")
        }
    }
    
    private func deleteTask(offsets: IndexSet) {
        withAnimation {
            offsets.map { tasks[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
