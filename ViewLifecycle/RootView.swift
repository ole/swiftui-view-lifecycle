import SwiftUI

struct RootView: View {
    @State private var columnVisibility: NavigationSplitViewVisibility = .doubleColumn

    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            Sidebar()
        } detail: {
            Text("Select an item in the sidebar.")
        }
    }
}

struct Sidebar: View {
    @State private var selection: CaseStudy? = nil

    var body: some View {
        List {
            ForEach(categories) { section in
                Section {
                    ForEach(section.elements) { caseStudy in
                        NavigationLink(value: caseStudy) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(caseStudy.label)
                                if let description = caseStudy.description {
                                    Text(description)
                                        .font(.callout)
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                    }
                } header: {
                    Text(section.label)
                }
            }
        }
        .navigationTitle("SwiftUI View Lifecycle")
        #if !os(macOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
        .navigationDestination(for: CaseStudy.self) { caseStudy in
            MainContent(caseStudy: caseStudy)
        }
    }
}

struct MainContent: View {
    var caseStudy: CaseStudy

    var body: some View {
        switch caseStudy {
        case .scrollView:
            CaseStudyScrollView()
        case .scrollViewVStackForEach:
            CaseStudyScrollViewVStackForEach()
        case .staticList:
            CaseStudyStaticList()
        case .list:
            CaseStudyList()
        case .lazyVGrid:
            CaseStudyLazyVGrid()
        case .tabView:
            CaseStudyTabView()
        default:
            Text("Unknown case study '\(caseStudy.label)'")
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
