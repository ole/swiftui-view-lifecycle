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
                            VStack(alignment: .leading, spacing: 4) {
                                Text(caseStudy.label)
                                    .lineLimit(nil)
                                if let description = caseStudy.description {
                                    Text(description)
                                        .font(.callout)
                                        .foregroundStyle(.secondary)
                                        .lineLimit(nil)
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
        case .ifElse:
            CaseStudyIfElse()
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
        case .navigationStack:
            #if os(macOS)
                Text("SwiftUI on macOS 13.0 can’t seem to handle a NavigationStack nested in a NavigationSplitView. Please test this one on iOS.")
            #else
                CaseStudyNavigationStack()
            #endif
        case .tabView:
            CaseStudyTabView()
        default:
            unknownCase
        }
    }

    @ViewBuilder private var unknownCase: some View {
        Text("Unhandled case study `\(caseStudy.label)`. Did you forget to add a case to `\(String(describing: type(of: self)))`?")
            .padding()
            .navigationTitle("Error")
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
