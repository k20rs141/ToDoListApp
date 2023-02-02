import SwiftUI

@main
struct ToDoListAppApp: App {
    @AppStorage(wrappedValue: 0, "appearanceMode") var appearanceMode
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .applyAppearenceSetting(DarkModeSetting(rawValue: self.appearanceMode) ?? .followSystem)
        }
    }
}

extension View {
    @ViewBuilder
    func applyAppearenceSetting(_ setting: DarkModeSetting) -> some View {
        switch setting {
        case .followSystem:
            self
                .preferredColorScheme(.none)
        case .darkMode:
            self
                .preferredColorScheme(.dark)
        case .lightMode:
            self
                .preferredColorScheme(.light)
        }
    }
}
