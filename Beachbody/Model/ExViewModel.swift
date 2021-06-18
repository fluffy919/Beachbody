//
//  ExViewModel.swift
//  Beachbody
//
//  Created by David Selioutsky on 6/17/21.
//

import SwiftUI

class ExListViewModel: ObservableObject {
    
    @Published var exer: [Exercise] = []
    @Published var isLoading = false
    private var canLoadMore = true
    private var nextURL: String
    
    init(_ exercise: Exer) {
        self.exer = exercise.results
        self.nextURL = Homework.excerciseUrl
    }
        
    func fetchEx() {
        guard !isLoading && canLoadMore else {
              return
        }
        
        isLoading = true

        APICall().getExercise(url: nextURL) { (exer, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else {
                guard let exer = exer else {
                    print("Fetch exer failed: Empty exer")
                    return
                }
                
                DispatchQueue.main.async {
                    self.exer += exer.results
                    self.isLoading.toggle()
                    self.canLoadMore = !(exer.next == nil)
                    self.nextURL = exer.next == nil ? "" : exer.next!
                    
                    self.exer.sort { (lhs: Exercise, rhs: Exercise) in
                        return lhs.creation_date > rhs.creation_date
                    }
                }
            }
        }
    }
}
