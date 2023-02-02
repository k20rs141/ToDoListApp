import SwiftUI

struct EditTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {

        NavigationView {
            
            ZStack {
                
                Text("EditView")
            }
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("完了")
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
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct EditTaskView_Previews: PreviewProvider {
    static var previews: some View {
        EditTaskView()
    }
}
