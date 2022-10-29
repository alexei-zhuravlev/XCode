//
//  PicsFromMovieGrid.swift
//  FilmsAppSwiftUI
//
//  Created by Алексей Журавлев on 28.10.2022.
//

import SwiftUI

struct PicsFromMovieGrid: View {
    
    var movie_id:Int
    let picsStorage = PicsFromMovieStorage.shared
    
    let columns = [GridItem(.adaptive(minimum: 100)),
                   GridItem(.adaptive(minimum: 100))]
    
    @State var arrayOfPics = [PicsFromMovieClass]()
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: columns,spacing: 5) {
                    ForEach(arrayOfPics){pic in
                        NavigationLink(destination: {
                            PicsFromMovieCarousel()
                        }, label: {
                            VStack {
                                AsyncImage(url: URL(string: pic.fileURL)) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            }
                        })
                    }
                }.onAppear{
                    FetchingPicsFromMovie().fetchingPicsFromMovie(movie_id: movie_id) {
                        self.arrayOfPics = picsStorage.arrayOfPics
                    }
                }
            }
        }
        .padding(.horizontal, 5)
    }
}

struct PicsFromMovieGrid_Previews: PreviewProvider {
    static var previews: some View {
        PicsFromMovieGrid(movie_id: 278)
    }
}
