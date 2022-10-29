//
//  DetailedMovieScreen.swift
//  FilmsAppSwiftUI
//
//  Created by Алексей Журавлев on 19.10.2022.
//

import SwiftUI

struct DetailedMovieScreen: View {
    
    
    var movie = ListOfMovies(id: 550, original_title: "God Father", poster_path: "/fCTjGJxKWZGWQDCGFGYMGvh4VNP.jpg", release_date: "", overview: "Some text here", vote_average: 0, backdrop_path: "")
    
    @State var  movie_id: Int = 550
    
    @State var picsArray = [PicsFromMovieClass]()
    
    var body: some View {
        
        VStack {
            VStack {
                VStack {
                    AsyncImage(url: URL(string: (TMDBDetails().urlToImagePath + movie.poster_path))) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .scaledToFit()
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.5), radius: 10, x: 3, y: 10)
                    
                    HStack {
                        ForEach(0..<Int(movie.vote_average), id:\.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                    .padding()
                    Text(movie.original_title)
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    Text(movie.overview)
                }
                .padding()
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(picsArray){element in
                            NavigationLink {
                                PicsFromMovieGrid(movie_id: movie.id)
                            } label: {
                                AsyncImage(url: URL(string: element.fileURL)) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 100,height: 50)
                                .aspectRatio(contentMode: .fit)
                            }
                        }
                    }
                    .onAppear{
                        FetchingPicsFromMovie().fetchingPicsFromMovie(movie_id: movie.id) {
                            self.picsArray = PicsFromMovieStorage.shared.arrayOfPics
                            print("############")
                            print("\(self.picsArray[0].id)")
                        }
                    }
                }
            }
        }
    }
}




struct DetailedMovieScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailedMovieScreen()
    }
}
