import SwiftUI

struct CaseStudyStaticList: View {
    var body: some View {
        List {
            Group {
                LifecycleMonitor(label: "0")
                LifecycleMonitor(label: "1")
                LifecycleMonitor(label: "2")
                LifecycleMonitor(label: "3")
                LifecycleMonitor(label: "4")
                LifecycleMonitor(label: "5")
                LifecycleMonitor(label: "6")
                LifecycleMonitor(label: "7")
                LifecycleMonitor(label: "8")
                LifecycleMonitor(label: "9")
            }
            Group {
                LifecycleMonitor(label: "10")
                LifecycleMonitor(label: "11")
                LifecycleMonitor(label: "12")
                LifecycleMonitor(label: "13")
                LifecycleMonitor(label: "14")
                LifecycleMonitor(label: "15")
                LifecycleMonitor(label: "16")
                LifecycleMonitor(label: "17")
                LifecycleMonitor(label: "18")
                LifecycleMonitor(label: "19")
            }
            Group {
                LifecycleMonitor(label: "20")
                LifecycleMonitor(label: "21")
                LifecycleMonitor(label: "22")
                LifecycleMonitor(label: "23")
                LifecycleMonitor(label: "24")
                LifecycleMonitor(label: "25")
                LifecycleMonitor(label: "26")
                LifecycleMonitor(label: "27")
                LifecycleMonitor(label: "28")
                LifecycleMonitor(label: "29")
            }
            Group {
                LifecycleMonitor(label: "30")
                LifecycleMonitor(label: "31")
                LifecycleMonitor(label: "32")
                LifecycleMonitor(label: "33")
                LifecycleMonitor(label: "34")
                LifecycleMonitor(label: "35")
                LifecycleMonitor(label: "36")
                LifecycleMonitor(label: "37")
                LifecycleMonitor(label: "38")
                LifecycleMonitor(label: "39")
            }
            Group {
                LifecycleMonitor(label: "40")
                LifecycleMonitor(label: "41")
                LifecycleMonitor(label: "42")
                LifecycleMonitor(label: "43")
                LifecycleMonitor(label: "44")
                LifecycleMonitor(label: "45")
                LifecycleMonitor(label: "46")
                LifecycleMonitor(label: "47")
                LifecycleMonitor(label: "48")
                LifecycleMonitor(label: "49")
            }
        }
        .navigationTitle("List")
    }
}

struct CaseStudyStaticList_Previews: PreviewProvider {
    static var previews: some View {
        CaseStudyStaticList()
    }
}
