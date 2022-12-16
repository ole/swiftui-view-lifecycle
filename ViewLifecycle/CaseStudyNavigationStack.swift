import SwiftUI

struct CaseStudyNavigationStack: View {
    @State private var navigationPath: [Int] = []

    var body: some View {
        NavigationStack(path: $navigationPath) {
            Content(level: 1)
                .navigationDestination(for: Int.self) { level in
                    Content(level: level)
                }
        }
    }

    struct Content: View {
        var level: Int

        var body: some View {
            List {
                Section {
                    NavigationLink(value: level + 1) {
                        LifecycleMonitor(label: "Level \(level)")
                    }
                } footer: {
                    if level == 1 {
                        Text("Navigation views keep the state of content views on the navigation stack alive. `onAppear` and `onDisappear` get called as you navigate. Popping a view off the stack ends the view's lifetime, destroying its state.")
                            .font(.callout)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle(level == 1 ? "NavigationStack" : "Level \(level)")
        }
    }
}

struct CaseStudyNavigationStack_Previews: PreviewProvider {
    static var previews: some View {
        CaseStudyNavigationStack()
    }
}
