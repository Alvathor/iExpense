//
//  UserDefauls.swift
//  iExpense
//
//  Created by Juliano Goncalves Alvarenga on 01/01/20.
//  Copyright © 2020 Ciclic. All rights reserved.
//

import SwiftUI

struct UserDefauls: View {
    
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            self.tapCount += 1
            UserDefaults.standard.set(self.tapCount, forKey: "Tap")
        }
    }
}

struct UserDefauls_Previews: PreviewProvider {
    static var previews: some View {
        UserDefauls()
    }
}
