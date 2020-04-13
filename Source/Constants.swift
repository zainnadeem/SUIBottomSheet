import SwiftUI
/// Constants holds  variable information to be used by the map
public enum Constants {

    //sizing
    static let subHeaderWidth: CGFloat = 300
    static let subHeaderHeight: CGFloat = 60
    static let bottomSheetLabelHeight: CGFloat = 20
    static let bottomSheetLabelWidthMultiplier: CGFloat = 0.5
    static let bottomSheetTitleFont = Font.system(size: 16, weight: .bold)
    static let bottomSheetSubtitleFont = Font.system(size: 14, weight: .regular)
    static let bottomSheetBodyFont = Font.system(size: 17, weight: .bold)
    //spacing
    static let minimumComponentSpacing: CGFloat = 10
    static let mediumComponentSpacing: CGFloat = 20
    static let maxComponentSpacing: CGFloat = 10
    static let bottomSheetBodyLineSpacing = 4
    //Indicator
    static let indicatorOpacity: Double = 0.4
    static let indicatorHeight: CGFloat = 3
    static let indicatorWidth: CGFloat = 60
    static let indicatorCornerRadius: CGFloat = 16
    //Ease Duration
    static let delayedEaseDuration: Double = 0.5
    static let normalEaseDuration: Double = 0.2
    
    //insets & padding
    static let indicatorInsets = EdgeInsets(top: 10, leading: 45, bottom: 0, trailing: 45)
    static let bottomSheetHeaderInsets = EdgeInsets(top: 0, leading: 45, bottom: 0, trailing: 20)
    static let dismissButtonInsets = EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: -25)
    static let bottomSheetBodyInsets = EdgeInsets(top: 0, leading: 1.5, bottom: 2, trailing: 1.5)
    static let bottomSheetDebugInformationInsets = EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0)
    //Animation value

    //View Manipulation
    static let bottomSheetCornerRadius: CGFloat = 13
    static let bottomSheetLinearGradientOpacity: Double = 0.6
    //String Literals
    static let close = "close"
    static let bottomSheet = "BottomSheet"
    static let bundle = "bundle"
    
    //optionsDefaults
    public static let defaultTitle: String = "My Custom Title"
    public static let defaultSubtitle: String = "Some more information here"
    public static let defaultBodyText: String  = "The user of this component can put whatever content they want in here, and it should be scrollable (without causing the sheet to pull up or down)!"
    public static let defaultResponse: Double = 0.55
    public static let defaultDampingFraction: Double = 0.825
    public static let defaultBlendDuration: Double = 0
    
}
