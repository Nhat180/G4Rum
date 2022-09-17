//
//  HomeView.swift
//  G4Rum
//
//  Created by Thang, Ta Quoc on 06/09/2022.
//

import SwiftUI
import CoreLocation

struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject private var gameViewModel = GameViewModel()
    @StateObject private var categoryViewModel = CategoryViewModel()
    @ObservedObject var authViewModel = AuthViewModel()
    @State private var search: String = ""
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: colorScheme == .dark ? ColorConstants.colorDarkMode : ColorConstants.colorLightMode),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                
                ScrollView (showsIndicators: false) {
                    VStack(alignment: .leading) {
                        HStack {
                            TitleView()
                                .padding()
                            
                            Spacer()
                        }
                        
                        Divider()
                            .overlay(colorScheme == .dark ? .white : .black)
                            .padding()

                        Text("Trending Game")
                            .font(.system(size: width / 15))
                            .bold()
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing:0) {
                                ForEach (gameViewModel.randomGames) {
                                    i in NavigationLink (
                                        destination: GameCardView(game: i), label: {
                                            VStack {
                                                AsyncImage(url: URL(string: i.imageUrl)) { image in
                                                            image
                                                                .resizable()
                                                                .frame(width: width / 2, height: width / 2)
                                                                .cornerRadius(20.0)
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                
                                                Spacer()
                                                Text(i.name)
                                                    .font(.system(size: width / 25))
                                                    .bold()
                                                Spacer()
                                                HStack (spacing: 5) {
                                                    Text("Rate: " + i.ratings + "/5")
                                                        .font(.system(size: width / 30))
                                                    Spacer()
                                                    Text( "Genre: " + i.genre)
                                                        .font(.system(size: width / 30))
                                                }
                                            }
                                            .frame(width: width / 2, height: width / 5 * 3)
                                            .padding()
                                            .background(.clear)
                                            .cornerRadius(20.0)
                                        })
                                    Spacer()

                                }
                            }
                        }
                        Divider()
                            .overlay(colorScheme == .dark ? .white : .black)
                            .padding()
                        Text("Categories")
                            .font(.system(size: width / 15))
                            .bold()
                            .padding(.horizontal)
                        
                            VStack {
                                ForEach (categoryViewModel.categories) {
                                    genre in NavigationLink (destination: GameListView (genre: genre.title),  label: {
                                        VStack {
                                            HStack {
                                                genre.image
                                                    .resizable()
                                                    .frame(width: width / 8, height: width / 8)
                                                    .cornerRadius(20.0)
                                                Spacer()
                                                Text(genre.title)
                                                    .font(.system(size: width / 20))
                                                    .padding(.horizontal)
                                                
                                            }
                                            .padding(.horizontal)
                                            Divider()
                                                .overlay(colorScheme == .dark ? .white : .black)
                                                .padding(.horizontal)
                                        }
                                    })
                                }
                            }
                            .background(.clear)
                            .cornerRadius(20.0)
                        
                    }
                }
            }.onAppear(){
                self.gameViewModel.getRandomGames()
                self.categoryViewModel.getAllCategories()
            }
            .navigationBarTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button(action: {
                            authViewModel.signOut()
                        }, label: {
                            Label("Log out", systemImage: "rectangle.portrait.and.arrow.right")
                        })
                    } label: {
                        Label (
                            title: {},
                            icon: {
                                Image(systemName: "person.circle")
                            }
                        )
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .accentColor(colorScheme == .dark ? .white : .black)
        .background(.clear)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TitleView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        Text("Find the \nBest ")
            .font(.system(size: width / 12))
            + Text("Game!")
            .font(.system(size: width / 10))
                .fontWeight(.bold)
    }
}



extension View{
    func getSafeArea()->UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as?
                UIWindowScene else {
            return .zero
        }

        guard let safeArea = screen.windows.first?.safeAreaInsets
        else {
            return .zero
        }
        return safeArea
    }
}


