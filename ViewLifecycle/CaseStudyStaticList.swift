import SwiftUI

struct CaseStudyStaticList: View {
    var body: some View {
        List {
            Group {
                OnAppearMonitor(label: "0")
                OnAppearMonitor(label: "1")
                OnAppearMonitor(label: "2")
                OnAppearMonitor(label: "3")
                OnAppearMonitor(label: "4")
                OnAppearMonitor(label: "5")
                OnAppearMonitor(label: "6")
                OnAppearMonitor(label: "7")
                OnAppearMonitor(label: "8")
                OnAppearMonitor(label: "9")
            }
            Group {
                OnAppearMonitor(label: "10")
                OnAppearMonitor(label: "11")
                OnAppearMonitor(label: "12")
                OnAppearMonitor(label: "13")
                OnAppearMonitor(label: "14")
                OnAppearMonitor(label: "15")
                OnAppearMonitor(label: "16")
                OnAppearMonitor(label: "17")
                OnAppearMonitor(label: "18")
                OnAppearMonitor(label: "19")
            }
            Group {
                OnAppearMonitor(label: "20")
                OnAppearMonitor(label: "21")
                OnAppearMonitor(label: "22")
                OnAppearMonitor(label: "23")
                OnAppearMonitor(label: "24")
                OnAppearMonitor(label: "25")
                OnAppearMonitor(label: "26")
                OnAppearMonitor(label: "27")
                OnAppearMonitor(label: "28")
                OnAppearMonitor(label: "29")
            }
            Group {
                OnAppearMonitor(label: "30")
                OnAppearMonitor(label: "31")
                OnAppearMonitor(label: "32")
                OnAppearMonitor(label: "33")
                OnAppearMonitor(label: "34")
                OnAppearMonitor(label: "35")
                OnAppearMonitor(label: "36")
                OnAppearMonitor(label: "37")
                OnAppearMonitor(label: "38")
                OnAppearMonitor(label: "39")
            }
            Group {
                OnAppearMonitor(label: "40")
                OnAppearMonitor(label: "41")
                OnAppearMonitor(label: "42")
                OnAppearMonitor(label: "43")
                OnAppearMonitor(label: "44")
                OnAppearMonitor(label: "45")
                OnAppearMonitor(label: "46")
                OnAppearMonitor(label: "47")
                OnAppearMonitor(label: "48")
                OnAppearMonitor(label: "49")
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
