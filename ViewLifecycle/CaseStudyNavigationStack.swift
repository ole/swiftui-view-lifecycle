import SwiftUI

struct CaseStudyNavigationStack: View {
    var body: some View {
        NavigationStack {
            Content(level: 1)
        }
    }

    struct Content: View {
        var level: Int

        var body: some View {
            List {
                Section {
                    NavigationLink {
                        Content(level: level + 1)
                    } label: {
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
