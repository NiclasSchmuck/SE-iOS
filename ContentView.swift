//
//  ContentView.swift
//  SE-Example
//
//  Created by Niclas Schmuck on 17.05.20.
//  Copyright © 2020 Niclas Schmuck. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var data : [Person]? = nil
    var body: some View {
        NavigationView {
            if self.data != nil {
                List(self.data!, id: \.name) { example in
                    VStack {
                        HStack {
                            Text(example.name)
                            Spacer()
                            VStack {
                                Text(example.address.street).fontWeight(.bold)
                                Text("\(example.address.town), \(example.address.postal)")
                            }
                        }
                    }
                }.navigationBarTitle(Text("Software Engineering")).animation(.easeIn).transition(.move(edge: .bottom)).navigationBarItems(trailing:
                    Button(action: {
                        self.data?.append(Person(name: "Added", address: Address(street: "Add Street", town: "Add Town", postal: "Add Postal"), email: "added@example.com"));
                    }) {
                        Image(systemName: "plus")
                })
            } else {
                Text("Loading Data...")
            }
            }.onAppear {
            let url = Bundle.main.url(forResource: "persons", withExtension: "json")!
            do {
                let persons = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                self.data = try decoder.decode([Person].self, from: persons)
            } catch { print("Unable to load persons: \(error)")
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
