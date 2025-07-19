//
//  ContentView.swift
//  ExpenseFlow
//
//  Created by Arman on 19/7/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    var body: some View {
        NavigationView{
            List{
                ForEach(expenses.items, id: \.id) { item in
                    
                    //Text(item.name)
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                            
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeItem)
            }
            .navigationTitle("Expense Flow 💰")
            .toolbar {
                Button{
                    showingAddExpense = true
                }
                
                label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense)
            {
                AddView(expenses: expenses)
            }
        }
    }
    func removeItem(at offsets: IndexSet ){
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
