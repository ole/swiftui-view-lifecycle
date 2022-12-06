import SwiftUI

struct CaseStudyList: View {
    @State private var items: [Item] = sampleItems

    var body: some View {
        List {
            ForEach(items) { item in
                let label = String(item.id.uuidString.prefix(8))
                LifecycleMonitor(label: label)
            }
            .onDelete { offsets in
                items.remove(atOffsets: offsets)
            }
        }
        .navigationTitle("List")
        .toolbar {
            ToolbarItem {
                Button("Prepend") {
                    let newItem = Item(id: UUID())
                    items.insert(newItem, at: 0)
                }
            }
            ToolbarItem {
                Button("Append") {
                    let newItem = Item(id: UUID())
                    items.append(newItem)
                }
            }
        }
        .animation(.default, value: items)
    }
}

struct CaseStudyList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CaseStudyList()
        }
    }
}
