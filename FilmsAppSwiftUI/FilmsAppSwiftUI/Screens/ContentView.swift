//
//  ContentView.swift
//  FilmsAppSwiftUI
//
//  Created by Алексей Журавлев on 18.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    
    init() {
               let navBarAppearance = UINavigationBar.appearance()
               navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
               navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
             }
    
    private var columns: [GridItem] = [
        GridItem(.flexible(minimum: 150), spacing: 16, alignment: .top),
        GridItem(.flexible(minimum: 150), spacing: 16, alignment: .top)
    ]
    
   @State var listOfMovies = [ListOfMovies]()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        LazyVGrid(columns: columns,alignment: .center ,spacing: 20) {
                            ForEach(listOfMovies){ item in
                                NavigationLink(destination: {
                                    DetailedMovieScreen(movie: item, movie_id: item.id)
                                }, label: {
                                    ZStack {
                                        VStack(alignment: .center) {
                                            AsyncImage(url: URL(string: (TMDBDetails().urlToImagePath + item.poster_path))) { image in
                                                image.resizable()
                                            } placeholder: {
                                                ProgressView()
                                            }
                                            .scaledToFit()
                                            .cornerRadius(20)
                                            .shadow(color: Color.black.opacity(0.5), radius: 10, x: 3, y: 10)
                                            
                                            
                                            Text(item.original_title)
                                                .font(.title3)
                                                .foregroundColor(.white)
                                            
                                            HStack(spacing: 3) {
                                                ForEach(0..<Int(item.vote_average), id:\.self) { _ in
                                                    Image(systemName: "star.fill")
                                                        .font(.system(size: 10))
                                                        .foregroundColor(.yellow)
                                                }
                                            }
//                                            .padding()
                                            
                                            Text(item.release_year)
                                                .font(.caption)
                                                .foregroundColor(.white)
//                                            Text(String(format: "%.1f", item.vote_average))
//                                                .font(.caption)
//                                                .foregroundColor(.white)
                                        }
                                    }
                                })
                            }
                        }
                    }
                    .padding()
                    .onAppear(){
                        FetchingListOfMovies().fetchingListOfMovies {
                            self.listOfMovies = StorageListOfMovies.shared.listOfMovies
                        }
                    }
                }
            }
            .navigationTitle("Top Rated Movie")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
