import SwiftUI

struct CaseStudyScrollViewStatic: View {
    var body: some View {
        ScrollView {
            LifecycleMonitor(label: "ScrollView top")


            VStack {
                Image(systemName: "arrow.down.circle.fill")
                Text("Scroll down")
            }
            .font(.largeTitle)
            .padding()

            Spacer(minLength: 2000)

            LifecycleMonitor(label: "ScrollView bottom")
        }
        .safeAreaInset(edge: .bottom) {
            Text("Nesting views in a `ScrollView` has no effect on those views’ lifecycle events. The entire content of the scroll view appears immediately when the scroll view appears, regardless of whether it’s on screen or not.")
                .font(.callout)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.regularMaterial)
        }
        .navigationTitle("Static ScrollView")
    }
}

struct CaseStudyScrollView_Previews: PreviewProvider {
    static var previews: some View {
        CaseStudyScrollViewStatic()
    }
}
