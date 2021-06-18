//
//  ExView.swift
//  Beachbody
//
//  Created by David Selioutsky on 6/17/21.
//

import SwiftUI

struct ExView: View {
    
    @ObservedObject var viewModel: ExListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Homework Assessment")
                    .font(.title)
                ExListView(
                    exers: viewModel.exer,
                    isLoading: viewModel.isLoading,
                    onScrolledAtBottom: viewModel.fetchEx
                )
                .navigationBarHidden(true)
                .onAppear(perform: viewModel.fetchEx)
            }
        }        
    }
}

struct ExView_Previews: PreviewProvider {
    static var previews: some View {
        ExView(
            viewModel: ExListViewModel(Exer()))
    }
}
