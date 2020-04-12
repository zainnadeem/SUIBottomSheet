import SwiftUI

/// Function that takes in a dragGesture value and assigns a sheetState
enum BottomSheetDragState {
    case inactive
    case isDragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .isDragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .isDragging:
            return true
        }
    }
}
