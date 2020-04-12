import SwiftUI
/// BottomSheetView utilized by developer inside of their view
public struct BottomSheetView: View {
    /// Tracks the state of the drag gesture, can be 'isdragging' or 'inactive'
    @GestureState private var bottomSheetDragState = BottomSheetDragState.inactive
     /// BottomSheet is initialized with options that contains information about the properties to be displayed
    @ObservedObject var options: BottomSheetOptions
    /// Creates indicator view for the top of the bottomSheet
    private var indicator: some View {
            RoundedRectangle(cornerRadius: Constants.indicatorCornerRadius)
            .fill(Color.gray).opacity(Constants.indicatorOpacity)
            .frame(width: Constants.indicatorWidth, height: Constants.indicatorHeight)
    }
     /// - Initializer:
       ///     - options:  bottomSheetOptions for the view
   public init(options: ObservedObject<BottomSheetOptions>) {
        self._options = options
    }
   ///     -View:  BottomSheet View Layout
   public var body: some View {
        GeometryReader { geometry in
            ZStack{
                VStack {
                    ///Header with indicator, title, subtitle & dismiss button
                    HStack(alignment: .center) {
                        VStack {
                            self.indicator.padding(Constants.indicatorInsets).animation(.none)
                            Text(self.options.title)
                                .font(Constants.bottomSheetTitleFont)
                                .modifier(BottomSheetLabelModifier(textColor: .black))
                                .frame(width: geometry.size.width * Constants.bottomSheetLabelWidthMultiplier, height: Constants.bottomSheetLabelHeight, alignment: .center)
                            Text(self.options.subtitle)
                                .font(Constants.bottomSheetSubtitleFont)
                                .modifier(BottomSheetLabelModifier(textColor: Color(UIColor.darkGray)))
                                .frame(width: geometry.size.width * Constants.bottomSheetLabelWidthMultiplier, height: Constants.bottomSheetLabelHeight, alignment: .center)
                        }.padding(Constants.bottomSheetHeaderInsets)
                        Button(action: {
                            self.options.sheetState = .dismissed
                        }) {
                            self.options.dismissImage
                                .accentColor(self.options.dismissAccentColor)
                        }.padding(Constants.dismissButtonInsets)
                    }
                    ///ScrollView with body text
                    ScrollView(.vertical){
                        Spacer()
                        VStack(alignment: .center){
                            Spacer()
                            Text(self.options.bodyText)
                                .font(Constants.bottomSheetBodyFont)
                                .foregroundColor(self.options.bodyTextColor)
                                .multilineTextAlignment(.center)
                                .lineSpacing(4)
                                .padding(Constants.bottomSheetBodyInsets)
                        }
                        Spacer()
                    }.frame(width: geometry.size.width, height: nil)
                        .background(LinearGradient(gradient: Gradient(colors: self.options.scrollViewColors), startPoint: .top, endPoint: .bottom).opacity(Constants.bottomSheetLinearGradientOpacity))
                }.transition(.identity).animation(.none)
                /// Add debug information to the ZStack
                if self.options.showingDebugInformation {
                    VStack {
                        Text("Visible")
                            .foregroundColor(.black)
                        if self.options.sheetState == .collapsed {
                            Text("Collapsed")
                                .foregroundColor(.black)
                        }
                        if self.options.sheetState == .expanded {
                            Text("Expanded")
                                .foregroundColor(.black)
                        }
                        Text("Animation Config").foregroundColor(.black)
                        Text("{'response': \(Constants.response)").foregroundColor(.black)
                        Text("'dampingFraction': \(Constants.dampingFraction)").foregroundColor(.black)
                        Text("'blendDuration': \(Constants.blendDuration)}").foregroundColor(.black)
                    }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
                        .padding(Constants.bottomSheetDebugInformationInsets)
                        .background(Color.white)
                        .transition(.identity).animation(.none)
                }
            }
        }
        .background(self.options.backgroundColor)
        .cornerRadius(Constants.bottomSheetCornerRadius)
        .animation(.interactiveSpring(response: Constants.response, dampingFraction:Constants.dampingFraction, blendDuration: Constants.blendDuration))
        .offset(y: self.options.sheetState.rawValue + self.bottomSheetDragState.translation.height)
        ///Gesture tracking when updated ,
        .gesture(
            DragGesture()
            .updating(self.$bottomSheetDragState) { drag, state, transaction in
                state = .isDragging(translation: drag.translation)
            }
            .onEnded(self.draggingDidEnd)
        )
    }
    /// Function that takes in a dragGesture value and assigns a sheetState
    private func draggingDidEnd(drag: DragGesture.Value) {
         /// This function will utiilize these three variable to determine the stateAbove, the stateBelow & the nearestState
        let stateAbove: BottomSheetState
        let stateBelow: BottomSheetState
        let nearestState: BottomSheetState
       /// Based on drag velocity, the predication of the final location:  drag.predictedEndLocation.y
       /// Current location of the drag gesture: drag.location.y
        let yDirection = drag.predictedEndLocation.y - drag.location.y
        /// drag.translation = Total translation from start of the drag gesture to current
        /// yDirection = The predicted end y location minus the current y location
        ///currentSheetLocation:  drag.translation = Sheet postion + distance it has moved
        let currentSheetLocation = self.options.sheetState.rawValue + drag.translation.height
        ///If the current sheet location is less than or equal to the raw height of collapsed state, the postion above is expanded, position below is collapsed
        if currentSheetLocation <= BottomSheetState.collapsed.rawValue {
                 stateAbove = .expanded
                 stateBelow = .collapsed
        ///If the current sheet location is greater than the raw height of collapsed state, the postion above is expanded, position below is dismissed
             } else {
                 stateAbove = .collapsed
                 stateBelow = .dismissed
             }
        ///If the (current sheet location - the position above) is less than (position below - current sheet location)
       if (currentSheetLocation - stateAbove.rawValue) < (stateBelow.rawValue - currentSheetLocation) {
               nearestState = stateAbove
           } else {
               nearestState = stateBelow
           }
        ///check yDirection value and assign the sheetState
        if yDirection > 0 && (self.options.sheetState != .expanded) {
               self.options.sheetState = stateBelow
           } else if yDirection < 0 {
            self.options.sheetState = stateAbove
           } else {
            self.options.sheetState  = nearestState
           }
     }
  
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView(options: .init(initialValue: BottomSheetOptions()))
    }
}

