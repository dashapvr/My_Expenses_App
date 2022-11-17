//
//  AddView.swift
//  My_Expenses_App
//
//  Created by Дарья Пивовар on 17.11.2022.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject var expenses: Expenses
   
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    let types = ["Personal", "Business"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Price", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationTitle("Add")
            .navigationBarItems(trailing: Button("Save") {
                if let actualAmount = Int(self.amount) {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
