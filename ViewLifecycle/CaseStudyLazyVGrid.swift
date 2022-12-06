import SwiftUI

struct CaseStudyLazyVGrid: View {
    @State private var items: [Item] = sampleItems

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init(.adaptive(minimum: 280))]) {
                ForEach(items) { item in
                    let label = String(item.id.uuidString.prefix(8))
                    LifecycleMonitor(label: label)
                }
            }
        }
        .navigationTitle("LazyVGrid")
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

struct CaseStudyLazyVGrid_Previews: PreviewProvider {
    static var previews: some View {
        CaseStudyLazyVGrid()
    }
}
