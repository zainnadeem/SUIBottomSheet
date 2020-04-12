import Foundation

public extension Bundle {
    internal static func appBundle() -> Bundle {
        return Bundle.init(for: BottomSheetOptions.self)
    }
    
     static func BottomSheet() -> Bundle? {
        guard let styleBundleUrl = Bundle.appBundle().url(forResource: "BottomSheet", withExtension: "bundle") else {
            return nil
        }
        return Bundle.init(url: styleBundleUrl)
    }
    

}

