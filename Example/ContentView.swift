import SwiftUI
import SUIBottomSheet

struct ContentView: View {
    @ObservedObject var options: BottomSheetOptions = BottomSheetOptions()
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Button(action: {
                    self.options.toggleSheet()
                }) {
                    Text("Test BottomSheet")
                }
                Spacer()
                Button(action: {
                    self.options.toggleDebugInformation()
                }) {
                    Text("Show Debug info")
                }
                Spacer()
                Spacer()
            }
            BottomSheetView(options: self._options)
        }
    }
    
    private func updateBackgroundColor()->Color{
        switch options.sheetState {
        case .dismissed:
            return .white
        case .collapsed:
            return .blue
        case .expanded:
            return .orange
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
