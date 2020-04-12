//
//  ContentView.swift
//  SUIBottomSheet_Example
//
//  Created by Zain Nadeem on 4/11/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import SwiftUI
import SUIBottomSheet

struct ContentView: View {
   @ObservedObject var options: BottomSheetOptions = BottomSheetOptions(indicatorColor: .blue, title: "Oscar Wilde", titleColor: .black, subtitle: "Intentions", subtitleColor: Color(UIColor.darkGray), bodyText: "Cyril (coming in through the open window from the terrace).  My dear Vivian...")
       
       var body: some View {
             ZStack {
               Button(action: {
                   self.options.toggleSheet()
               }) {
                   Text("Test BottomSheet")
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
