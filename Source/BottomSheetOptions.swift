import SwiftUI
/// A BottomSheetViews initialized with BottomSheetOptions  that contain information about the properties to be displayed on the view
public class BottomSheetOptions : ObservableObject {
   @Published public var indicatorColor: Color
   @Published public var title: String
   @Published public var titleColor: Color
   @Published public var subtitle: String
   @Published public var subtitleColor: Color
   @Published public var bodyText: String
   @Published public var bodyTextColor: Color
   @Published public var backgroundColor: Color
   @Published public var scrollViewColors: [Color]
   @Published public var dismissAccentColor: Color
   @Published public var showingDebugInformation: Bool
   @Published public var sheetState: BottomSheetState = .dismissed
   @Published public var animation: Animation
   @Published public var dismissImage: Image?
   @State private var isPresented: Bool = false {
         didSet {
             if self.sheetState == .collapsed { self.sheetState = .dismissed } else { self.sheetState = .collapsed }
         }
     }
/// - Initializer
        /// Can be initialized with any variation of parameters 
 public init(indicatorColor: Color = .secondary,
         title: String = Constants.defaultTitle,
         titleColor: Color = .black,
         subtitle: String = Constants.defaultSubtitle,
         subtitleColor: Color = Color(.darkGray),
         bodyText: String  = Constants.defaultBodyText,
         bodyTextColor: Color = .white,
         backgroundColor: Color = .white,
         scrollViewColors: [Color] = [.black, .gray],
         dismissImage: Image? = nil,
         dismissAccentColor: Color = .black,
         animation: Animation = .interactiveSpring(response: Constants.defaultResponse, dampingFraction: Constants.defaultDampingFraction, blendDuration: Constants.defaultBlendDuration),
         showingDebugInformation: Bool = false){
        
        self.indicatorColor = indicatorColor
        self.title = title
        self.titleColor = titleColor
        self.subtitle = subtitle
        self.subtitleColor = subtitleColor
        self.bodyText = bodyText
        self.bodyTextColor = bodyTextColor
        self.backgroundColor = backgroundColor
        self.scrollViewColors = scrollViewColors
        self.dismissAccentColor = dismissAccentColor
        self.animation = animation
        self.showingDebugInformation = showingDebugInformation
        self.dismissImage = dismissImage ??  getImageFromBundle(Constants.close, imageExtension: "png")
    }
    
/// Obtains image from BottomSheet bundle.
    private func getImageFromBundle(_ name: String, imageExtension: String)->Image{
        if let fileURL = Bundle.BottomSheet()?.url(forResource: name, withExtension: imageExtension) {
             if let fileContents = UIImage(contentsOfFile: fileURL.path){
                 return(Image(uiImage: fileContents))
             }
         }
        return Image(uiImage: UIImage())
     }
    
/// Displays & hides the bottomSheet
 public func toggleSheet(){
        switch isPresented {
        case true:
            isPresented = false
        default:
            isPresented = true
        }
    }
/// Displays & hides debug information
    public func toggleDebugInformation(){
           switch showingDebugInformation {
           case true:
               showingDebugInformation = false
           default:
               showingDebugInformation = true
           }
       }
}

