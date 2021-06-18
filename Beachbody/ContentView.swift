//
//  ContentView.swift
//  Beachbody
//
//  Created by David Selioutsky on 6/17/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ExView(viewModel: ExListViewModel(Exer()))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
