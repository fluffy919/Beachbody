//
//  ExRowView.swift
//  Beachbody
//
//  Created by David Selioutsky on 6/18/21.
//

import SwiftUI

struct ExRowView: View {
    
    let exer: Exercise
    
    var body: some View {
        VStack {
            Text(exer.name).font(.headline)
                .padding()
            Text(exer.description
                    .replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil))
        }
        .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
    }
}
