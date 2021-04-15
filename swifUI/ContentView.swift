//
//  ContentView.swift
//  swifUI
//
//  Created by Adsum MAC 3 on 15/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var checkAmount = ""
    @State var noOfPeople = 2
    @State var tipPercentage = 2
    let tipPercentages = [10,15,20,25,0]
    
    var totalPerPeron : Double{
        let peopelCount = Double(noOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopelCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", text: $checkAmount).keyboardType(.decimalPad)
                
                    Picker("Number of People", selection: $noOfPeople){
                        ForEach(2..<100){
                            Text("People : \($0)")
                        }
                    }
                }
                Section(header: Text("How much tip do you want to leave? ")){
                    Picker("Tip percentage", selection: $tipPercentage) {
                        
                        ForEach(0..<tipPercentages.count){
                            Text("\(tipPercentages[$0])%")
                        }

                    }.pickerStyle(SegmentedPickerStyle())
                }
    
                Section(header: Text("Your split Amount")){
                    Text("Your Split Amount :  ₹\(totalPerPeron,specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Amount",displayMode: .large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
