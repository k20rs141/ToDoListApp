import SwiftUI

struct HomeView: View {
    // データの取得
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Task.name, ascending: true)], animation: .easeInOut) var tasks: FetchedResults<Task>
    @Environment(\.managedObjectContext) var viewContext
    // SideView
    @State private var width = UIScreen.main.bounds.width - 90
    @State private var x = -UIScreen.main.bounds.width + 90
    
    var body: some View {
            ZStack(alignment: .leading) {
                NavigationView {
                    List{
                        ForEach(self.tasks, id: \.self) { task in
                           HStack {
                               Image(systemName: task.checked ? "checkmark.circle.fill" : "circle")
                                   .font(.system(size: 26))
                                   .foregroundColor(.primary)
                                   .onTapGesture {
                                       task.checked.toggle()
                                       try? viewContext.save()
                                       UIImpactFeedbackGenerator(style: .medium)
                                           .impactOccurred()
                                   }
                               Text(task.name ?? "nil")

                               Spacer()

                               Text(task.priority ?? "nil")
                           }
                           .frame(height: 50)
                           .padding(.horizontal, 10)
                        }
                        .onDelete(perform: deleteTask)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.vertical, 3)
                    }
                    .listStyle(.plain)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                withAnimation(.easeInOut(duration: 0.7)) {
                                    x = 0
                                }
                            }) {
                                Image(systemName: "line.horizontal.3")
                            }
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            KebabMenu()
                        }
                    }
                }
                ZStack {
                    AddTaskButton()
                        .frame(width: 80, height: 80)
                        //新規ボタンの位置変更
                        .offset(x: UIScreen.main.bounds.width * 0.73, y: UIScreen.main.bounds.height * 0.39)
                }
                HamburgerMenu()
                    .offset(x: x)
                    .background(
                        Color.black.opacity(x == 0 ? 0.5 : 0)
                            .ignoresSafeArea(.all, edges: .vertical)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.7)) {
                                    x = -width
                                }
                            }
                    )
            }
            .gesture(DragGesture(minimumDistance: 35)
                // スワイプしている間の処理
                .onChanged { value in
                    withAnimation(.easeInOut(duration: 0.7)) {
                        if value.location.x > value.startLocation.x {
                            x = 0
                        }
                    }
                }
                // スワイプが完了した時の処理
                .onEnded { value in
                    withAnimation(.easeInOut(duration: 0.7)) {
                        if x == 0 {
                            if value.location.x < value.startLocation.x {
                                x = -width
                            }
                        }
                    }
                }
            )
    }
    
    private func deleteTask(offsets: IndexSet) {
        withAnimation {
            offsets.map { tasks[$0] }.forEach(viewContext.delete)

            do {
                // データベースへ保存
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct AddTaskButton: View {
    @Environment(\.managedObjectContext) var viewContext
    @State private var showAddTaskView = false
    
    var body: some View {
        Button {
            showAddTaskView.toggle()
        } label: {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .padding()
        }
        .sheet(isPresented: $showAddTaskView) {
            AddTaskView().environment(\.managedObjectContext, self.viewContext)
        }
    }
}
