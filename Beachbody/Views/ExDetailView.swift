//
//  ExDetailView.swift
//  Beachbody
//
//  Created by David Selioutsky on 6/18/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ExDetailView: View {
    
    @ObservedObject var detailViewModel: ExDetailViewModel
    @State var isLoadedUrl = false
    
    var body: some View {
        VStack {
            if isLoadedUrl {
                
                WebImage(url: URL(string: String(Homework.exRoot + (detailViewModel.thumb.original ?? ""))))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
                
            }
            

            HStack {
                let cateName = detailViewModel.exerDetail.category?.name
                Text("Category: ")
                    .fontWeight(.semibold)
                Spacer()
                Text(cateName ?? "")
            }
            .padding(.vertical)
            
            HStack(alignment: .top) {
                Text("Equipments: ")
                    .fontWeight(.semibold)
                Spacer()
                VStack(alignment: .trailing) {
                    ForEach(detailViewModel.exerDetail.equipment ?? []) { equipment in
                            Text(equipment.name)
                    }
                }
            }
        }
        .onAppear(perform: detailViewModel.fetchThumb)
        .onAppear(perform: detailViewModel.fetchDetail)
        .onChange(of: detailViewModel.isLoadedURL, perform: { _ in
            isLoadedUrl.toggle()
        })
        .padding()
        .navigationTitle(detailViewModel.exerDetail.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ExDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExDetailView(
            detailViewModel: ExDetailViewModel(ExerDetail(345)))
    }
}
