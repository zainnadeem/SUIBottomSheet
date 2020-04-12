import SwiftUI
///Utilized to layout labels on the bottomSheet
struct BottomSheetLabelModifier : ViewModifier{
    @State var textColor: Color = .white
    func body(content: Content) -> some View {
        return content
        .allowsTightening(true)
        .lineLimit(2)
        .foregroundColor(textColor)
    }
}
