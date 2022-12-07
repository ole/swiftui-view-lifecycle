import SwiftUI

struct CaseStudyLazyVGrid: View {
    private static let initialItemCount = 40
    @State private var items: [Item] = (1...Self.initialItemCount).map { i in
        Item(id: "Item \(i)")
    }
    @State private var nextID: Int = Self.initialItemCount + 1

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init(.adaptive(minimum: 150))]) {
                ForEach(items) { item in
                    VStack(spacing: 4) {
                        LifecycleMonitor(label: item.id)
                        Button(role: .destructive) {
                            if let idx = items.firstIndex(where: { $0.id == item.id }) {
                                items.remove(at: idx)
                            }
                        } label: {
                            Label("Delete", systemImage: "minus.circle")
                        }
                    }
                    .padding(4)
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            Text("`LazyVGrid` behaves very much like `List`, recycling views during scrolling, so `onAppear` gets called often. But the state gets preserved for all child views.")
                .font(.callout)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
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
        .navigationTitle("LazyVGrid")
    }
}

struct CaseStudyLazyVGrid_Previews: PreviewProvider {
    static var previews: some View {
        CaseStudyLazyVGrid()
    }
}
