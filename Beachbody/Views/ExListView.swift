//
//  ExListView.swift
//  Beachbody
//
//  Created by David Selioutsky on 6/18/21.
//

import SwiftUI

struct ExListView: View {
    
    let exers: [Exercise]
    let isLoading: Bool
    let onScrolledAtBottom: () -> Void
    
    var body: some View {
        List {
            exerList
            if isLoading {
                loadingIndicator
            }
        }        
    }
    
    private var exerList: some View {
        ForEach(exers) { exer in
            NavigationLink(
                destination: ExDetailView(
                    detailViewModel: ExDetailViewModel(ExerDetail(exer.id)))) {
                ExRowView(exer: exer).onAppear {
                    if self.exers.last == exer {
                        self.onScrolledAtBottom()
                    }
                }
            }
        }
    }
    
    private var loadingIndicator: some View {
        Spinner(style: .medium)
            .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
    }
}
