import SwiftUI

struct CaseStudyScrollViewVStackForEach: View {
    private static let initialItemCount = 40
    @State private var items: [Item] = (1...Self.initialItemCount).map { i in
        Item(id: "Item \(i)")
    }
    @State private var nextID: Int = Self.initialItemCount + 1

    var body: some View {
        ScrollView {
            VStack {
                ForEach(items) { item in
                    HStack {
                        LifecycleMonitor(label: item.id)
                        Button(role: .destructive) {
                            if let idx = items.firstIndex(where: { $0.id == item.id }) {
                                items.remove(at: idx)
                            }
                        } label: {
                            Label("Delete", systemImage: "minus.circle")
                                .labelStyle(.iconOnly)
                        }
                    }
                    .padding()
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            Text("Unlike `List`, a `ScrollView` has no effect on its content views’ lifecycle, even if those content views are created dynamically with `ForEach`. All children appear at once and never disappear, even if they’re not on screen initially.")
                .font(.callout)
                .padding()
                .background(.regularMaterial)
        }
        .toolbar {
            ToolbarItem {
                Button("Prepend") {
                    let newItem = Item(id: "Item \(nextID)")
                    nextID += 1
                    items.insert(newItem, at: 0)
                }
            }
            ToolbarItem {
                Button("Append") {
                    let newItem = Item(id: "Item \(nextID)")
                    nextID += 1
                    items.append(newItem)
                }
            }
        }
        .animation(.default, value: items)
        .navigationTitle("Dynamic ScrollView")
    }
}

struct CaseStudyScrollViewVStackForEach_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CaseStudyScrollViewVStackForEach()
        }
    }
}
