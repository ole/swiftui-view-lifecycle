import SwiftUI

enum CaseStudy: String, CaseIterable, Identifiable {
    case scrollView = "ScrollView with static content"
    case scrollViewVStackForEach = "ScrollView > VStack > ForEach"
    case list = "List with dynamic content"

    var id: Self {
        self
    }

    var label: String {
        rawValue
    }
}

struct RootView: View {
    @State private var selection: CaseStudy? = nil
    @State private var columnVisibility: NavigationSplitViewVisibility = .doubleColumn

    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            Sidebar(selection: $selection)
        } detail: {
            if let selection {
                Primary(caseStudy: selection)
            } else {
                Text("Select an item in the sidebar.")
            }
        }
    }
}

struct Sidebar: View {
    @Binding var selection: CaseStudy?

    var body: some View {
        List(CaseStudy.allCases, selection: $selection) { caseStudy in
            NavigationLink(value: caseStudy) {
                Text(caseStudy.label)
            }
        }
        .navigationTitle("When is onAppear called?")
        .navigationBarTitleDisplayMode(.inline)
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
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
