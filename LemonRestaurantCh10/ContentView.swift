//
//  ContentView.swift
//  LemonRestaurantCh10
//
//  Created by Michael Deal on 6/2/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "keyboard.fill")
                .imageScale(.large)
                .foregroundStyle(.red)
            Text("Cohort 10!")
            Text("Welcome")
                .font(.caption)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
