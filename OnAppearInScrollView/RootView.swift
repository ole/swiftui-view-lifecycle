import SwiftUI

struct Category: Identifiable {
    var id: String
    var label: String
    var elements: [CaseStudy]
}

struct CaseStudy: Identifiable, Hashable {
    var id: String
    var label: String
    var description: String?
}

extension CaseStudy {
    static let scrollView: Self = .init(
        id: "scrollView",
        label: "ScrollView with static content"
    )
    static let scrollViewVStackForEach: Self = .init(
        id: "scrollViewVStackForEach",
        label: "ScrollView > VStack > ForEach",
        description: "A VStack with dynamic content, embedded in a ScrollView"
    )
    static let list: Self = .init(
        id: "list",
        label: "List with dynamic content"
    )
}

let categories: [Category] = [
    Category(
        id: "scrollview",
        label: "ScrollView",
        elements: [
            .scrollView,
            .scrollViewVStackForEach,
        ]
    ),
    Category(
        id: "list",
        label: "List",
        elements: [
            .list
        ]
    ),
]

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
                            VStack(spacing: 8) {
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
        .navigationTitle("When is onAppear called?")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: CaseStudy.self) { caseStudy in
            Primary(caseStudy: caseStudy)
        }
    }
}

struct Primary: View {
    var caseStudy: CaseStudy

    var body: some View {
        switch caseStudy {
        case .scrollView:
            CaseStudyScrollView()
        case .scrollViewVStackForEach:
            CaseStudyScrollViewVStackForEach()
        case .list:
            CaseStudyList()
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