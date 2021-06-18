//
//  ExDetailViewModel.swift
//  Beachbody
//
//  Created by David Selioutsky on 6/18/21.
//

import SwiftUI

class ExDetailViewModel: ObservableObject {
    
    @Published var exerDetail: ExerDetail
    @Published var thumb: Thumb
    @Published var isLoadedURL: Bool = false
    private var id: Int
    
    init(_ exerDetail: ExerDetail) {
        self.exerDetail = exerDetail
        self.id = exerDetail.id
        self.thumb = Thumb()
    }
    
    func fetchDetail() {
        APICall().getDetail(id: id) { (detail, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else {
                guard let detail = detail else {
                    print("Fetch detail failed: Empty detail")
                    return
                }
                
                DispatchQueue.main.async {
                    self.exerDetail = detail
                }
            }
        }
    }
    
    func fetchThumb() {
        APICall().getThumb(id: id) { (thumb, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else {
                guard let thumb = thumb else {
                    print("Fetch detail failed: Empty detail")
                    return
                }
                
                DispatchQueue.main.async {
                    self.thumb = thumb
                    self.isLoadedURL.toggle()
                }
            }
        }
    }
}
