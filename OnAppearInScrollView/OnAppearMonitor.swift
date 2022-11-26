import SwiftUI

struct OnAppearMonitor: View {
    var label: String
    @State private var stateTimestamp: Date = Date.now
    @State private var onAppearTimestamp: Date? = nil

    var body: some View {
        Grid {
            Text(label)
            GridRow {
                Text("State reset")
                    .gridColumnAlignment(.leading)
                Text("\(stateTimestamp, style: .timer) ago")
                    .monospacedDigit()
                    .bold()
                    .gridColumnAlignment(.leading)
            }
            GridRow {
                Text("onAppear")
                ZStack {
                    if let t = onAppearTimestamp {
                        Text("\(t, style: .timer) ago")
                            .monospacedDigit()
                            .bold()
                    }
                }
                .animation(.easeOut(duration: 1), value: onAppearTimestamp)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.random())
        }
        .onAppear {
            let timestamp = Date.now
            print("\(timestamp) \(label): onAppear")
            onAppearTimestamp = timestamp
        }
        .onDisappear {
            print("\(Date.now) \(label): onDisappear")
        }
    }
}

struct OnAppearMonitor_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ForEach(1..<100) { i in
                OnAppearMonitor(label: "\(i)")
            }
        }
    }
}

extension Color {
    static func random() -> Self {
        Color(
            red: .random(in: 0.5...0.9),
            green: .random(in: 0.5...0.9),
            blue: .random(in: 0.5...0.9)
        )
    }
}
