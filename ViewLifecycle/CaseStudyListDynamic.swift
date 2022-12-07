import SwiftUI

struct CaseStudyListDynamic: View {
    private static let initialItemCount = 40
    @State private var items: [Item] = (1...Self.initialItemCount).map { i in
        Item(id: "Item \(i)")
    }
    @State private var nextID: Int = Self.initialItemCount + 1

    var body: some View {
        List {
            ForEach(items) { item in
                LifecycleMonitor(label: item.id)
            }
            .onDelete { offsets in
                items.remove(atOffsets: offsets)
            }
        }
        .safeAreaInset(edge: .bottom) {
            Text("`List` recycles views during scrolling, so `onAppear` gets called often. But `List` preserves the state for all list items.")
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
        .navigationTitle("List")
    }
}

struct CaseStudyList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CaseStudyListDynamic()
        }
    }
}
