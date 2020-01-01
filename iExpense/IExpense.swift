//
//  CodableObj.swift
//  iExpense
//
//  Created by Juliano Goncalves Alvarenga on 01/01/20.
//  Copyright © 2020 Ciclic. All rights reserved.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet { encodeObj() }
    }
        
    private func encodeObj() {
        guard let encoded = try? JSONEncoder().encode(items) else { return }
        UserDefaults.standard.set(encoded, forKey: "Items")
    }
    
    init() {
        self.items = []
        guard let data = UserDefaults.standard.data(forKey: "Items") else { return }
        guard let decodedItems =
            try? JSONDecoder()
                .decode([ExpenseItem].self,from: data)
            else { return }
        
        self.items = decodedItems
    }
}

struct IExpense: View {
    
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text("$\(item.amount)")
                    }
                }
                .onDelete(perform: removeItens(at:))
            }
            .navigationBarTitle("iExpenses")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingAddExpense.toggle()
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: self.expenses)
            }
        }
    }
    
    private func removeItens(at offSets: IndexSet) {
        expenses.items.remove(atOffsets: offSets)
    }
}

struct IExpense_Previews: PreviewProvider {
    static var previews: some View {
        IExpense()
    }
}
