import SwiftUI

struct CaseStudyListStatic: View {
    var body: some View {
        List {
            Group {
                LifecycleMonitor(label: "Child 0")
                LifecycleMonitor(label: "Child 1")
                LifecycleMonitor(label: "Child 2")
                LifecycleMonitor(label: "Child 3")
                LifecycleMonitor(label: "Child 4")
                LifecycleMonitor(label: "Child 5")
                LifecycleMonitor(label: "Child 6")
                LifecycleMonitor(label: "Child 7")
                LifecycleMonitor(label: "Child 8")
                LifecycleMonitor(label: "Child 9")
            }
            Group {
                LifecycleMonitor(label: "Child 10")
                LifecycleMonitor(label: "Child 11")
                LifecycleMonitor(label: "Child 12")
                LifecycleMonitor(label: "Child 13")
                LifecycleMonitor(label: "Child 14")
                LifecycleMonitor(label: "Child 15")
                LifecycleMonitor(label: "Child 16")
                LifecycleMonitor(label: "Child 17")
                LifecycleMonitor(label: "Child 18")
                LifecycleMonitor(label: "Child 19")
            }
            Group {
                LifecycleMonitor(label: "Child 20")
                LifecycleMonitor(label: "Child 21")
                LifecycleMonitor(label: "Child 22")
                LifecycleMonitor(label: "Child 23")
                LifecycleMonitor(label: "Child 24")
                LifecycleMonitor(label: "Child 25")
                LifecycleMonitor(label: "Child 26")
                LifecycleMonitor(label: "Child 27")
                LifecycleMonitor(label: "Child 28")
                LifecycleMonitor(label: "Child 29")
            }
        }
        .safeAreaInset(edge: .bottom) {
            Text("Lists with static content recycle their child views too. They behave like dynamic lists.")
                .font(.callout)
                .padding()
                .background(.regularMaterial)
        }
        .navigationTitle("List")
    }
}

struct CaseStudyStaticList_Previews: PreviewProvider {
    static var previews: some View {
        CaseStudyListStatic()
    }
}
