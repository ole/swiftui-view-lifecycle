import SwiftUI

@main
struct ViewLifecycleApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        #if os(macOS)
            Window("NavigationStack", id: "navigation-stack") {
                CaseStudyNavigationStack()
                    .toolbar {
                        ToolbarItem {
                            Color.clear
                        }
                    }
            }
        #endif
    }
}
