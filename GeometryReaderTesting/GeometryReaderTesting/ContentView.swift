//
//  ContentView.swift
//  GeometryReaderTesting
//
//  Created by Serge Ostrowsky on 27/05/2020.
//  Copyright © 2020 Serge Ostrowsky. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let arrayWithStuff = [ "one","two","three","four","five","six","seven","eight","nine","ten", "eleven", "twelve"]
    
    var heightOfView: CGFloat = 0.0 // To be set by GeometryReader
    
    var body: some View {
            
    let myString = "Top of Test App"
        
     return   ZStack {
            GeometryReader { g in
                heightOfView = g.size.height
        NavigationView {
        
            print("height of view : \(heightOfView)")
             ScrollView {
                VStack {
                    Text(myString)
                    .padding()
                    Divider()
                    self.ViewBody()
                } // END of Vstack
                    .navigationBarTitle("Test App", displayMode: .inline)
            } // END of Scrollview
                }//End of NavigationView
            } // End of Geometry reader
        } // End of Zstack

  } // End of body
    
    
    @ViewBuilder func ViewBody() -> some View {
        VStack {
            List {
                ForEach (self.arrayWithStuff, id: \.self) { item in
                    Text(item) }
            } // END of List
                .frame(maxHeight: heightOfView*0.5)
            Divider()
            Text("Bottom of TEST APP")
        }
        .padding()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
