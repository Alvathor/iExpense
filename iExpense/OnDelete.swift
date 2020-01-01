//
//  OnDelete.swift
//  iExpense
//
//  Created by Juliano Goncalves Alvarenga on 01/01/20.
//  Copyright © 2020 Ciclic. All rights reserved.
//

import SwiftUI

struct OnDelete: View {
    
    @State private var numbers = [Int]()
    @State private var currentNumbber = 0
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("\($0)")
                    }
                    .onDelete(perform: removeRows(at:))
                }
                
                Button("Add Number") {
                    self.numbers.append(self.currentNumbber)
                    self.currentNumbber += 1
                }
            }
            .navigationBarItems(leading: EditButton())
        }
    }
    
    private func removeRows(at offSets: IndexSet) {
        numbers.remove(atOffsets: offSets)
    }
}

struct OnDelete_Previews: PreviewProvider {
    static var previews: some View {
        OnDelete()
    }
}
