//
//  ContentView.swift
//  iExpense
//
//  Created by Juliano Goncalves Alvarenga on 31/12/19.
//  Copyright © 2019 Ciclic. All rights reserved.
//

import SwiftUI

struct SecondView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var name: String
    
    var body: some View {
        Button("Dismiss") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    var body: some View {
        Button("Show sheet") {
            self.showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "@Juliano")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
