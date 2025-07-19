//
//  AddView.swift
//  ExpenseFlow
//
//  Created by Arman on 19/7/25.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    let types = ["Business","Personal"]
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Name", text: $name)
                Picker("Type", selection: $type)
                {
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount,format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }.navigationTitle("Add New Expense")
                .toolbar {
                    Button("Save"){
                        let item = ExpenseItem(name: self.name, type: self.type, amount: self.amount)
                        expenses.items.append(item)
                        dismiss()
                    }
                    
                }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
