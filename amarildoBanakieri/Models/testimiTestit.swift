
import SwiftUI

struct TestView: View {
        var body: some View {
            NavigationView {
                VStack {
                    Text("Hello World")
                    NavigationLink(destination: DetailView()) {
                        Text("Do Something")
                    }
                }
            }
        }
    }

struct contentView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
