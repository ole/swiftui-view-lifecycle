import SwiftUI

struct CaseStudyTabView: View {
    var body: some View {
        TabView {
            LifecycleMonitor(label: "Tab 1")
                .padding()
                .tabItem {
                    Label("Tab 1", systemImage: "1.circle")
                }
            LifecycleMonitor(label: "Tab 2")
                .padding()
                .tabItem {
                    Label("Tab 2", systemImage: "2.circle")
                }
            LifecycleMonitor(label: "Tab 3")
                .padding()
                .tabItem {
                    Label("Tab 3", systemImage: "3.circle")
                }
            LifecycleMonitor(label: "Tab 4")
                .padding()
                .tabItem {
                    Label("Tab 4", systemImage: "4.circle")
                }
        }
        .navigationTitle("TabView")
    }
}

struct CaseStudyTabView_Previews: PreviewProvider {
    static var previews: some View {
        CaseStudyTabView()
    }
}
