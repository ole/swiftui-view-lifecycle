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
    static let ifElse: Self = .init(
        id: "ifElse",
        label: "if/else"
    )

    static let scrollView: Self = .init(
        id: "scrollView",
        label: "ScrollView with static content"
    )

    static let scrollViewVStackForEach: Self = .init(
        id: "scrollViewVStackForEach",
        label: "ScrollView > VStack > ForEach",
        description: "A VStack with dynamic content, embedded in a ScrollView"
    )

    static let staticList: Self = .init(
        id: "staticList",
        label: "List with static content"
    )

    static let list: Self = .init(
        id: "list",
        label: "List with dynamic content",
        description: "List recycles views during scrolling, so onAppear gets called often. But List preserves the State for all list items."
    )

    static let lazyVGrid: Self = .init(
        id: "lazyVGrid",
        label: "LazyVGrid"
    )

    static let navigationStack: Self = .init(
        id: "navigationStack",
        label: "NavigationStack",
        description: "A NavigationStack with infinite levels of drill-down."
    )

    static let tabView: Self = .init(
        id: "tabView",
        label: "TabView",
        description: "TabView with multiple tabs, each with static content."
    )
}

let categories: [Category] = [
    Category(
        id: "simple",
        label: "Simple views",
        elements: [
            .ifElse,
        ]
    ),
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
            .staticList,
            .list,
        ]
    ),
    Category(
        id: "lazy",
        label: "Lazy containers",
        elements: [
            .lazyVGrid,
        ]
    ),
    Category(
        id: "navigation",
        label: "Navigation containers",
        elements: [
            .navigationStack,
            .tabView,
        ]
    ),
]
