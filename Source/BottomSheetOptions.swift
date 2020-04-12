import SwiftUI
/// A BottomSheetViewis initialized with BottomSheetOptions  that contain information about the properties to be displayed on the view
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
    public var dismissImage: Image?
  
    @State private var isPresented: Bool = false {
         didSet {
             if self.sheetState == .collapsed { self.sheetState = .dismissed } else { self.sheetState = .collapsed }
         }
     }
/// - Initializer
        /// Can be initialized with any variation of parameters 
 public init(indicatorColor: Color = .secondary,
         title: String = "My Custom Title",
         titleColor: Color = .black,
         subtitle: String = "Some more information here",
         subtitleColor: Color = Color(.darkGray),
         bodyText: String  = "The user of this component can put whatever content they want in here, and it should be scrollable (without causing the sheet to pull up or down)!",
         bodyTextColor: Color = .white,
         backgroundColor: Color = .white,
         scrollViewColors: [Color] = [.pink, .purple],
         dismissAccentColor: Color = .black,
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
        self.showingDebugInformation = showingDebugInformation
    
        self.dismissImage = self.getImageFromBundle(Constants.close, imageExtension: "png")
    }
       
    private func getImageFromBundle(_ name: String, imageExtension: String)->Image?{
        if let fileURL = Bundle.BottomSheet()?.url(forResource: name, withExtension: imageExtension) {
             if let fileContents = UIImage(contentsOfFile: fileURL.path){
                 return(Image(uiImage: fileContents))
             }
         }
         return nil
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
}

